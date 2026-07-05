import 'package:equatable/equatable.dart';

abstract class OnboardingEvents extends Equatable {
  const OnboardingEvents();

  R when<R>({
    required R Function() goToNext,
    required R Function() goToPrevious,
    required R Function() skip,
  }) {
    if (this is OnboardingNextEvent) {
      return goToNext();
    } else if (this is OnboardingPreviousEvent) {
      return goToPrevious();
    } else if (this is OnboardingSkipEvent) {
      return skip();
    } else {
      throw Exception('Unknown event type: $this');
    }
  }

  @override
  List<Object> get props => [];
}

class OnboardingNextEvent extends OnboardingEvents {
  const OnboardingNextEvent();

  @override
  List<Object> get props => [];
}

class OnboardingSkipEvent extends OnboardingEvents {
  @override
  List<Object> get props => [];
}

class OnboardingPreviousEvent extends OnboardingEvents {
  const OnboardingPreviousEvent();
  @override
  List<Object> get props => [];
}
