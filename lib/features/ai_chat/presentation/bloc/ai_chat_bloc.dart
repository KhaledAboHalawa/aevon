import 'dart:async';

import 'package:aevon/core/errors/errors_handler.dart';
import 'package:aevon/core/shared/data/model/result.dart';
import 'package:aevon/features/ai_chat/domain/entity/chat_message.dart';
import 'package:aevon/features/ai_chat/domain/usecases/get_chat_onboarding_state_use_case.dart';
import 'package:aevon/features/ai_chat/domain/usecases/send_message_use_case.dart';
import 'package:aevon/features/ai_chat/domain/usecases/set_chat_onboarding_state_use_case.dart';
import 'package:aevon/features/ai_chat/domain/usecases/start_new_chat_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'ai_chat_event.dart';
part 'ai_chat_state.dart';

@singleton
class AiChatCubit extends Cubit<AiChatState> {
  final GetChatOnboardingStateUseCase getChatOnboardingStateUseCase;
  final SetChatOnboardingStateUseCase setChatOnboardingStateUseCase;
  final SendMessageUseCase sendMessageUseCase;
  final StartNewChatUseCase startNewChatUseCase;
  StreamSubscription<Result<String>>? _messageSubscription;
  AiChatCubit({
    required this.getChatOnboardingStateUseCase,
    required this.setChatOnboardingStateUseCase,
    required this.sendMessageUseCase,
    required this.startNewChatUseCase,
  }) : super(const AiChatState.initial()) {
    _checkOnBoardingSeen();
  }

  void doIntent(AiChatEvent event) {
    event.when(
      onBoardingSeen: () => _setOnBoardingSeen(),
      checkOnBoardingSeen: () => _checkOnBoardingSeen(),
    );
  }

  void _setOnBoardingSeen() async {
    final result = await setChatOnboardingStateUseCase();
    result.when(
      success: (value) => emit(state.copyWith(isOnboardingSeen: value)),
      error: (error) => emit(state.copyWith(errorMessage: error.message)),
    );
  }

  void _checkOnBoardingSeen() {
    final result = getChatOnboardingStateUseCase();
    result.when(
      success: (value) => emit(state.copyWith(isOnboardingSeen: value)),
      error: (error) => emit(state.copyWith(errorMessage: error.message)),
    );
  }

  Future<void> startNewChat() async {
    final result = startNewChatUseCase();
    result.when(
      success: (value) => emit(
        state.copyWith(messages: [], isStreaming: false, errorMessage: null),
      ),
      error: (error) => emit(state.copyWith(errorMessage: error.message)),
    );
  }

  Future<void> sendMessage({required String message}) async {
    if (message.trim().isEmpty) return;
    if (state.isStreaming) return;

    await _messageSubscription?.cancel();

    // Add user message
    final userMessage = ChatMessage(content: message, role: MessageRole.user);

    emit(
      state.copyWith(
        messages: [...state.messages, userMessage],
        isStreaming: true,
      ),
    );

    _messageSubscription = sendMessageUseCase(message: message).listen((
      result,
    ) {
      result.when(
        success: (chunk) => _handleChunk(chunk),
        error: (failure) => _handleError(failure),
      );
    }, onDone: () => _handleStreamDone());
  }

  void _handleChunk(String chunk) {
    if (state.messages.isEmpty) return;

    final messages = [...state.messages];

    final lastMessage = messages.last;

    if (lastMessage.role == MessageRole.assistant) {
      messages[messages.length - 1] = ChatMessage(
        content: lastMessage.content + chunk,
        role: MessageRole.assistant,
      );
    } else {
      messages.add(ChatMessage(content: chunk, role: MessageRole.assistant));
    }

    emit(state.copyWith(messages: messages));
  }

  void _handleError(Failure failure) {
    emit(state.copyWith(isStreaming: false, errorMessage: failure.message));
  }

  void _handleStreamDone() {
    emit(state.copyWith(isStreaming: false));
  }

  @override
  Future<void> close() async {
    await _messageSubscription?.cancel();
    return super.close();
  }
}
