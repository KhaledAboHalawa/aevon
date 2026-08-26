part of 'ai_chat_bloc.dart';

abstract class AiChatEvent extends Equatable {
  const AiChatEvent();

  @override
  List<Object> get props => [];

  void when({
    required Function() onBoardingSeen,
    required Function() checkOnBoardingSeen,
    required Function(String message) sendMessage,
    required Function() startNewChat,
    required Function() getConversationsHistory,
    required void Function(Conversation conversation) changeCurrentConversation,
  }) {
    switch (this) {
      case OnBoardingSeenEvent _:
        onBoardingSeen();
      case CheckOnBoardingSeenEvent _:
        checkOnBoardingSeen();
      case SendMessageEvent sendMessageEvent:
        sendMessage(sendMessageEvent.message);
      case StartNewChatEvent _:
        startNewChat();
      case GetConversationsHistoryEvent _:
        getConversationsHistory();
      case ChangeCurrentConversation changeCurrentConversationEvent:
        changeCurrentConversation(changeCurrentConversationEvent.conversation);
    }
  }
}

class OnBoardingSeenEvent extends AiChatEvent {
  const OnBoardingSeenEvent();
}

class CheckOnBoardingSeenEvent extends AiChatEvent {
  const CheckOnBoardingSeenEvent();
}

class SendMessageEvent extends AiChatEvent {
  final String message;
  const SendMessageEvent({required this.message});
}

class StartNewChatEvent extends AiChatEvent {
  const StartNewChatEvent();
}

class GetConversationsHistoryEvent extends AiChatEvent {
  const GetConversationsHistoryEvent();
}

class ChangeCurrentConversation {
  final Conversation conversation;
  const ChangeCurrentConversation({required this.conversation});
}
