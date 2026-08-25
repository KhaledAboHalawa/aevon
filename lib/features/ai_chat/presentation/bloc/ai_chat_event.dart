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
