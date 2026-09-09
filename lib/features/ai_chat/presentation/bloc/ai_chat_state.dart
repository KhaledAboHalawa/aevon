part of 'ai_chat_bloc.dart';

class AiChatState extends Equatable {
  final bool isOnboardingSeen;
  final Conversation conversation;
  final BaseState<List<Conversation>> getConversationsHistoryState;
  final BaseState<HistoryConversation> deleteConversationState;
  final bool isStreaming;
  final String? errorMessage;
  AiChatState.initial()
    : isOnboardingSeen = false,
      isStreaming = false,
      conversation = Conversation.empty(),
      errorMessage = null,
      getConversationsHistoryState =
          const BaseState<List<Conversation>>.initial(),
      deleteConversationState = const BaseState<HistoryConversation>.initial();
  const AiChatState({
    required this.isOnboardingSeen,
    required this.isStreaming,
    required this.errorMessage,
    required this.conversation,
    required this.getConversationsHistoryState,
    required this.deleteConversationState,
  });

  AiChatState copyWith({
    bool? isStreaming,
    bool? isOnboardingSeen,
    String? errorMessage,
    Conversation? conversation,
    BaseState<List<Conversation>>? getConversationsHistoryState,
    BaseState<HistoryConversation>? deleteConversationState,
  }) {
    return AiChatState(
      isStreaming: isStreaming ?? this.isStreaming,
      errorMessage: errorMessage,
      isOnboardingSeen: isOnboardingSeen ?? this.isOnboardingSeen,
      conversation: conversation ?? this.conversation,
      getConversationsHistoryState:
          getConversationsHistoryState ?? this.getConversationsHistoryState,
      deleteConversationState:
          deleteConversationState ?? const BaseState.initial(),
    );
  }

  @override
  List<Object?> get props => [
    conversation,
    isStreaming,
    isOnboardingSeen,
    errorMessage,
    getConversationsHistoryState,
    deleteConversationState,
  ];
}
