import 'package:aevon/features/onboarding/presentation/cubit/onboarding_events.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'onboarding_state.dart';

@lazySingleton
class OnboardingCubit extends Cubit<OnboardingState> {
  int index = 0;
  OnboardingCubit() : super(OnboardingInitial());

  void doIntent(OnboardingEvents event) {
    event.when(
      goToNext: _next,
      goToPrevious: _previous,
      skip: () {
        emit(OnboardingFinal());
      },
    );
  }

  void _previous() {
    if (state is OnboardingInitial) {
      return;
    }
    index--;
    if (index == 0) {
      emit(OnboardingInitial());
    } else {
      emit(OnboardingSecond());
    }
  }

  void _next() {
    if (state is OnboardingFinal) {
      return;
    }
    index++;
    if (index == 2) {
      emit(OnboardingFinal());
    } else {
      emit(OnboardingSecond());
    }
  }
}
