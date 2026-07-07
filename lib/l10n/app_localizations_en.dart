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
  String get next => 'Next';

  @override
  String get back => 'Back';

  @override
  String get doIt => 'Do It';

  @override
  String get skip => 'Skip';
}
