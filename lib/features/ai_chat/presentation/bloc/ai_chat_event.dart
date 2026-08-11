part of 'ai_chat_bloc.dart';

abstract class AiChatEvent extends Equatable {
  const AiChatEvent();

  @override
  List<Object> get props => [];

  void when({
    required Function() onBoardingSeen,
    required Function() checkOnBoardingSeen,
  }) {
    switch (this) {
      case OnBoardingSeenEvent _:
         onBoardingSeen();
      case CheckOnBoardingSeenEvent _:
         checkOnBoardingSeen();
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
  const SendMessageEvent({
    required this.message,
  });
}