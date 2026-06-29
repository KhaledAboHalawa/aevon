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
  String get onboardingTitle1 => 'the price of excellence\nis discipline';

  @override
  String get onboardingTitle2 => 'Fitness has never been\nso much funny';

  @override
  String get onboardingTitle3 => 'NO MORE EXCUSES\nDo It Now';

  @override
  String get onboardingdescription =>
      'Lorem ipsum dolor sit amet consectetur. Eu urna ut gravida quis id pretium purus. Mauris massa ';
}
