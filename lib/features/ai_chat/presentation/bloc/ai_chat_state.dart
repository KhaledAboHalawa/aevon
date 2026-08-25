part of 'ai_chat_bloc.dart';

class AiChatState extends Equatable {
  final bool isOnboardingSeen;
  final Conversation conversation;
  final bool isLoading;
  final bool isStreaming;
  final String? errorMessage;
  AiChatState.initial()
    : isOnboardingSeen = false,
      isLoading = false,
      isStreaming = false,
      conversation = Conversation.empty(),
      errorMessage = null;
  const AiChatState({
    required this.isOnboardingSeen,
    required this.isLoading,
    required this.isStreaming,
    required this.errorMessage,
    required this.conversation,
  });

  AiChatState copyWith({
    bool? isLoading,
    bool? isStreaming,
    bool? isOnboardingSeen,
    String? errorMessage,
    Conversation? conversation,
  }) {
    return AiChatState(
      isLoading: isLoading ?? this.isLoading,
      isStreaming: isStreaming ?? this.isStreaming,
      errorMessage: errorMessage,
      isOnboardingSeen: isOnboardingSeen ?? this.isOnboardingSeen,
      conversation: conversation ?? this.conversation,
    );
  }

  @override
  List<Object?> get props => [
    conversation,
    isLoading,
    isStreaming,
    isOnboardingSeen,
    errorMessage,
  ];
}
