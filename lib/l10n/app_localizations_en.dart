// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Aevon';

  @override
  String get notFoundError => 'Resource not found.';

  @override
  String get conflictError => 'A conflict occurred. Please retry.';

  @override
  String get apiLogicalError => 'API returned a logical error';

  @override
  String get connectTimeoutEreror => 'Connection timeout occur';

  @override
  String get cancelError => 'Request was cancelled.';

  @override
  String get receiveTimeoutError => 'Receive timeout occurred';

  @override
  String get sendTimeoutError => 'Send timeout occurred.';

  @override
  String get cacheError => 'Cache error occurred.';

  @override
  String get noInternetConnectionError => 'No internet connec';

  @override
  String get defaultError => 'An unexpected error occurred.';

  @override
  String get onboardingdescription =>
      'Lorem ipsum dolor sit amet consectetur. Eu urna ut gravida quis id pretium purus. Mauris massa ';

  @override
  String onboardingMessage(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'NO MORE EXCUSES\nDo It Now',
      one: 'Fitness has never been\nso much funny',
      zero: 'the price of excellence\nis discipline',
    );
    return '$_temp0';
  }

  @override
  String get firstName => 'First Name';

  @override
  String get lastName => 'Last Name';

  @override
  String get next => 'Next';

  @override
  String get back => 'Back';

  @override
  String get doIt => 'Do It';

  @override
  String get skip => 'Skip';

  @override
  String get male => 'Male';

  @override
  String get female => 'Female';

  @override
  String get year => 'Year';

  @override
  String get weight => 'Weight';

  @override
  String get height => 'Height';

  @override
  String get heyThere => 'Hey There';

  @override
  String get welecomeBack => 'WELCOME BACK';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get forgetPassword => 'Forget Password ? ';

  @override
  String get confirmPassword => 'Confirm Password';

  @override
  String get signIn => 'Login';

  @override
  String get register => 'Register';

  @override
  String get dontHaveAccount => 'Don\'t Have An Account Yet ? ';

  @override
  String get alreadyHaveAccount => 'Already Have An Account ? ';

  @override
  String get finish => 'Finish';

  @override
  String signUpTitle(String step) {
    String _temp0 = intl.Intl.selectLogic(step, {
      '0': 'CREATE AN ACCOUNT',
      '1': 'TELL US ABOUT YOURSELF',
      '2': 'How Old Are You',
      '3': 'WHAT IS YOUR WEIGHT',
      '4': 'WHAT IS YOUR HEIGHT',
      '5': 'WHAT IS YOUR GOAL',
      '6': 'WHAT IS YOUR ACTIVITY LEVEL',
      'other': 'CHOOSE THE ANSWER',
    });
    return '$_temp0';
  }

  @override
  String signUpSubtitle(String step) {
    String _temp0 = intl.Intl.selectLogic(step, {
      '0': 'Hey There',
      '1': 'We Need To Know Your Gender',
      'other': 'this helps us create Your personalized plan',
    });
    return '$_temp0';
  }
}
