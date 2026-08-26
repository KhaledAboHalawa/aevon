import 'dart:async';
import 'package:aevon/core/errors/errors_handler.dart';
import 'package:aevon/core/shared/data/model/result.dart';
import 'package:aevon/features/ai_chat/data/mapper/conversation_mapper.dart';
import 'package:aevon/features/ai_chat/domain/entity/chat_message.dart';
import 'package:aevon/features/ai_chat/domain/entity/conversation.dart';
import 'package:aevon/features/ai_chat/domain/usecases/get_chat_onboarding_state_use_case.dart';
import 'package:aevon/features/ai_chat/domain/usecases/get_conversations_history_use_case.dart';
import 'package:aevon/features/ai_chat/domain/usecases/init_conversation_history_use_case.dart';
import 'package:aevon/features/ai_chat/domain/usecases/save_message_in_history_use_case.dart';
import 'package:aevon/features/ai_chat/domain/usecases/send_message_use_case.dart';
import 'package:aevon/features/ai_chat/domain/usecases/set_chat_onboarding_state_use_case.dart';
import 'package:aevon/features/ai_chat/domain/usecases/start_new_chat_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_ai/firebase_ai.dart';
import 'package:flutter/widgets.dart';
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
  final GetConversationsHistoryUseCase getChatHistoryUseCase;
  final SaveMessageInHistoryUseCase saveMessageInHistoryUseCase;
  final InitConversationHistoryUseCase initConversationHistoryUseCase;
  StreamSubscription<Result<String>>? _messageSubscription;
  AiChatCubit({
    required this.getChatOnboardingStateUseCase,
    required this.setChatOnboardingStateUseCase,
    required this.sendMessageUseCase,
    required this.startNewChatUseCase,
    required this.getChatHistoryUseCase,
    required this.saveMessageInHistoryUseCase,
    required this.initConversationHistoryUseCase,
  }) : super(AiChatState.initial()) {
    _checkOnBoardingSeen();
  }

  void doIntent(AiChatEvent event) {
    event.when(
      onBoardingSeen: _setOnBoardingSeen,
      checkOnBoardingSeen: _checkOnBoardingSeen,
      sendMessage: (String message) => _sendMessage(message: message),
      startNewChat: _startNewChat,
      getConversationsHistory: _getConversationHistory,
      changeCurrentConversation: (Conversation conversation) =>
          _changeCurrentConversation(conversation: conversation),
    );
  }

  Future<void> _changeCurrentConversation({
    required Conversation conversation,
  }) async {
    _startNewChat(history: conversation.messages.toModelMessages());
    emit(state.copyWith(conversation: conversation));
  }

  Future<void> _getConversationHistory() async {
    emit(state.copyWith(conversatoinsHistoryisLoading: true));
    final result = await getChatHistoryUseCase();
    result.when(
      success: (value) => emit(
        state.copyWith(
          conversationsHistory: value,
          conversatoinsHistoryisLoading: false,
        ),
      ),
      error: (error) => emit(
        state.copyWith(
          errorMessage: error.message,
          conversatoinsHistoryisLoading: false,
        ),
      ),
    );
  }

  Future<void> _startNewChat({List<Content>? history}) async {
    final result = startNewChatUseCase(history: history);
    result.when(
      success: (value) => emit(
          state.copyWith(
            conversation: Conversation(
              id: UniqueKey().toString(),
              title: '',
              createdAt: DateTime.now(),
              updatedAt: DateTime.now(),
              messages: [],
            ),
            isStreaming: false,
            errorMessage: null,
          ),
        ),
      error: (error) => emit(state.copyWith(errorMessage: error.message)),
    );
  }

  Future<void> _sendMessage({required String message}) async {
    if (message.trim().isEmpty) return;
    if (state.isStreaming) return;

    await _messageSubscription?.cancel();

    // Add user message
    final userMessage = ChatMessage(
      content: message,
      role: MessageRole.user,
      id: state.conversation.messages.length.toString(),
    );

    emit(
      state.copyWith(
        conversation: state.conversation.copyWith(
          updatedAt: DateTime.now(),
          id: state.conversation.id,
          messages: [...state.conversation.messages, userMessage],
          title: (userMessage.id == '0')
              ? userMessage.content
              : state.conversation.title,
        ),
        isStreaming: true,
      ),
    );
    if (userMessage.id == '0') {
      initConversationHistoryUseCase(conversation: state.conversation);
    } else {
      saveMessageInHistoryUseCase(
        message: userMessage,
        conversationId: state.conversation.id,
      );
    }

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
    if (state.conversation.messages.isEmpty) return;

    final messages = [...state.conversation.messages];

    final lastMessage = messages.last;

    if (lastMessage.role == MessageRole.assistant) {
      messages[messages.length - 1] = ChatMessage(
        content: lastMessage.content + chunk,
        role: MessageRole.assistant,
        id: state.conversation.messages.length.toString(),
      );
    } else {
      messages.add(
        ChatMessage(
          content: chunk,
          role: MessageRole.assistant,
          id: state.conversation.messages.length.toString(),
        ),
      );
    }

    emit(
      state.copyWith(
        conversation: state.conversation.copyWith(messages: messages),
      ),
    );
  }

  void _handleError(Failure failure) {
    emit(state.copyWith(isStreaming: false, errorMessage: failure.message));
  }

  void _handleStreamDone() {
    if (state.conversation.messages.last.role == MessageRole.assistant) {
      saveMessageInHistoryUseCase(
        message: state.conversation.messages.last,
        conversationId: state.conversation.id,
      );
    }
    emit(state.copyWith(isStreaming: false));
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

  @override
  Future<void> close() async {
    await _messageSubscription?.cancel();
    return super.close();
  }
}
