part of 'ai_chat_bloc.dart';

class AiChatState extends Equatable {
  final bool isOnboardingSeen;
  final Conversation conversation;
  final List<Conversation> conversationsHistory;
  final bool conversatoinsHistoryisLoading;
  final bool isStreaming;
  final String? errorMessage;
  AiChatState.initial()
    : isOnboardingSeen = false,
      conversatoinsHistoryisLoading = false,
      isStreaming = false,
      conversation = Conversation.empty(),
      conversationsHistory = [],
      errorMessage = null;
  const AiChatState({
    required this.isOnboardingSeen,
    required this.conversatoinsHistoryisLoading,
    required this.isStreaming,
    required this.errorMessage,
    required this.conversation,
    required this.conversationsHistory,
  });

  AiChatState copyWith({
    bool? conversatoinsHistoryisLoading,
    bool? isStreaming,
    bool? isOnboardingSeen,
    String? errorMessage,
    Conversation? conversation,
    List<Conversation>? conversationsHistory,
  }) {
    return AiChatState(
      conversatoinsHistoryisLoading:
          conversatoinsHistoryisLoading ?? this.conversatoinsHistoryisLoading,
      isStreaming: isStreaming ?? this.isStreaming,
      errorMessage: errorMessage,
      isOnboardingSeen: isOnboardingSeen ?? this.isOnboardingSeen,
      conversation: conversation ?? this.conversation,
      conversationsHistory: conversationsHistory ?? this.conversationsHistory,
    );
  }

  @override
  List<Object?> get props => [
    conversation,
    conversatoinsHistoryisLoading,
    isStreaming,
    isOnboardingSeen,
    errorMessage,
  ];
}
