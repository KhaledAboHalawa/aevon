part of 'ai_chat_bloc.dart';

class AiChatState extends Equatable {
  final bool isOnboardingSeen;
  final List<ChatMessage> messages;
  final bool isLoading;
  final bool isStreaming;
  final String? errorMessage;
  const AiChatState.initial()
    : isOnboardingSeen = false,
      isLoading = false,
      isStreaming = false,
      messages = const [],
      errorMessage = null;
  const AiChatState({
    required this.isOnboardingSeen,
    required this.messages,
    required this.isLoading,
    required this.isStreaming,
    required this.errorMessage,
  });

  AiChatState copyWith({
    List<ChatMessage>? messages,
    bool? isLoading,
    bool? isStreaming,
    bool? isOnboardingSeen,
    String? errorMessage,
  }) {
    return AiChatState(
      messages: messages ?? this.messages,
      isLoading: isLoading ?? this.isLoading,
      isStreaming: isStreaming ?? this.isStreaming,
      errorMessage: errorMessage,
      isOnboardingSeen: isOnboardingSeen ?? this.isOnboardingSeen,
    );
  }

  @override
  List<Object?> get props => [
    messages,
    isLoading,
    isStreaming,
    isOnboardingSeen,
    errorMessage,
  ];
}
