import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Aevon'**
  String get appName;

  /// No description provided for @notFoundError.
  ///
  /// In en, this message translates to:
  /// **'Resource not found.'**
  String get notFoundError;

  /// No description provided for @conflictError.
  ///
  /// In en, this message translates to:
  /// **'A conflict occurred. Please retry.'**
  String get conflictError;

  /// No description provided for @apiLogicalError.
  ///
  /// In en, this message translates to:
  /// **'API returned a logical error'**
  String get apiLogicalError;

  /// No description provided for @connectTimeoutEreror.
  ///
  /// In en, this message translates to:
  /// **'Connection timeout occur'**
  String get connectTimeoutEreror;

  /// No description provided for @cancelError.
  ///
  /// In en, this message translates to:
  /// **'Request was cancelled.'**
  String get cancelError;

  /// No description provided for @receiveTimeoutError.
  ///
  /// In en, this message translates to:
  /// **'Receive timeout occurred'**
  String get receiveTimeoutError;

  /// No description provided for @sendTimeoutError.
  ///
  /// In en, this message translates to:
  /// **'Send timeout occurred.'**
  String get sendTimeoutError;

  /// No description provided for @cacheError.
  ///
  /// In en, this message translates to:
  /// **'Cache error occurred.'**
  String get cacheError;

  /// No description provided for @noInternetConnectionError.
  ///
  /// In en, this message translates to:
  /// **'No internet connec'**
  String get noInternetConnectionError;

  /// No description provided for @defaultError.
  ///
  /// In en, this message translates to:
  /// **'An unexpected error occurred.'**
  String get defaultError;

  /// No description provided for @onboardingdescription.
  ///
  /// In en, this message translates to:
  /// **'Lorem ipsum dolor sit amet consectetur. Eu urna ut gravida quis id pretium purus. Mauris massa '**
  String get onboardingdescription;

  /// onboardingMessage
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{the price of excellence\nis discipline} =1{Fitness has never been\nso much funny} other{NO MORE EXCUSES\nDo It Now}}'**
  String onboardingMessage(num count);

  /// No description provided for @firstName.
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get firstName;

  /// No description provided for @lastName.
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get lastName;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @doIt.
  ///
  /// In en, this message translates to:
  /// **'Do It'**
  String get doIt;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @male.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get male;

  /// No description provided for @female.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get female;

  /// No description provided for @heyThere.
  ///
  /// In en, this message translates to:
  /// **'Hey There'**
  String get heyThere;

  /// No description provided for @welecomeBack.
  ///
  /// In en, this message translates to:
  /// **'WELCOME BACK'**
  String get welecomeBack;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @forgetPassword.
  ///
  /// In en, this message translates to:
  /// **'Forget Password ? '**
  String get forgetPassword;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get signIn;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @dontHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t Have An Account Yet ? '**
  String get dontHaveAccount;

  /// No description provided for @alreadyHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already Have An Account ? '**
  String get alreadyHaveAccount;

  /// signUpTitle
  ///
  /// In en, this message translates to:
  /// **'{step, select, 0{CREATE AN ACCOUNT} 1{TELL US ABOUT YOURSELF} 2{How Old Are You} 3{WHAT IS YOUR WEIGHT} 4{WHAT IS YOUR HEIGHT} 5{WHAT IS YOUR GOAL} 6{WHAT IS YOUR ACTIVITY LEVEL} other{CHOOSE THE ANSWER}}'**
  String signUpTitle(String step);

  /// signUpSubtitle
  ///
  /// In en, this message translates to:
  /// **'{step, select, 0{Hey There} 1{We Need To Know Your Gender} other{this helps us create Your personalized plan}}'**
  String signUpSubtitle(String step);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
