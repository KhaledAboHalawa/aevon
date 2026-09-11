import 'package:aevon/core/utils/app_constants.dart';
import 'package:aevon/features/onboarding/presentation/cubit/onboarding_events.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'onboarding_state.dart';

@lazySingleton
class OnboardingCubit extends Cubit<OnboardingState> {
  final SharedPreferences _sharedPreferences;
  int index = 0;
  OnboardingCubit({required this._sharedPreferences})
    : super(OnboardingInitial());

  void doIntent(OnboardingEvents event) {
    event.when(
      goToNext: _next,
      goToPrevious: _previous,
      skip: _skip,
      done: _next,
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

  void _next() async {
    if (state is OnboardingFinal) {
      emit(OnboardingFinished());
      await _sharedPreferences.setBool(AppKeys.seenOnboarding, true);
      return;
    }
    index++;
    if (index == 2) {
      emit(OnboardingFinal());
    } else {
      emit(OnboardingSecond());
    }
  }

  Future<void> _skip() async {
    emit(OnboardingFinished());
    await _sharedPreferences.setBool(AppKeys.seenOnboarding, true);
  }
}
