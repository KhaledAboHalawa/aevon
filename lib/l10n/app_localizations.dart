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

  /// No description provided for @year.
  ///
  /// In en, this message translates to:
  /// **'Year'**
  String get year;

  /// No description provided for @kg.
  ///
  /// In en, this message translates to:
  /// **'KG'**
  String get kg;

  /// No description provided for @cm.
  ///
  /// In en, this message translates to:
  /// **'CM'**
  String get cm;

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

  /// No description provided for @finish.
  ///
  /// In en, this message translates to:
  /// **'Finish'**
  String get finish;

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

  /// forgetPasswordTitles
  ///
  /// In en, this message translates to:
  /// **'{page, select, 0{Forget password} 1{OTP CODE} other{Create New Password}}'**
  String forgetPasswordTitles(String page);

  /// forgetPasswordSubtitles
  ///
  /// In en, this message translates to:
  /// **'{page, select, 0{Enter Your Email} 1{Enter Your OTP Check your email} other{Create New Password}}'**
  String forgetPasswordSubtitles(String page);

  /// No description provided for @sendOtp.
  ///
  /// In en, this message translates to:
  /// **'Send OTP'**
  String get sendOtp;

  /// No description provided for @verify.
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get verify;

  /// No description provided for @rePassword.
  ///
  /// In en, this message translates to:
  /// **'Re-Password'**
  String get rePassword;

  /// No description provided for @didntReceiveCode.
  ///
  /// In en, this message translates to:
  /// **'Didn\'t Receive Verification Code?'**
  String get didntReceiveCode;

  /// No description provided for @resendCode.
  ///
  /// In en, this message translates to:
  /// **'Resend Code'**
  String get resendCode;

  /// No description provided for @chatOnboardingBottomSheetTitle.
  ///
  /// In en, this message translates to:
  /// **'How Can I Assist You\n Today?'**
  String get chatOnboardingBottomSheetTitle;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// No description provided for @hi.
  ///
  /// In en, this message translates to:
  /// **'Hi'**
  String get hi;

  /// No description provided for @chatOnboardingHeaderTitle.
  ///
  /// In en, this message translates to:
  /// **'I am your smart coach'**
  String get chatOnboardingHeaderTitle;

  /// No description provided for @chatHeaderTitle.
  ///
  /// In en, this message translates to:
  /// **'Smart Coach'**
  String get chatHeaderTitle;

  /// No description provided for @explore.
  ///
  /// In en, this message translates to:
  /// **'Explore'**
  String get explore;

  /// No description provided for @chat.
  ///
  /// In en, this message translates to:
  /// **'Chat'**
  String get chat;

  /// No description provided for @workouts.
  ///
  /// In en, this message translates to:
  /// **'Workouts'**
  String get workouts;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @editProfile.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get editProfile;

  /// No description provided for @changePassword.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get changePassword;

  /// No description provided for @selectLanguage.
  ///
  /// In en, this message translates to:
  /// **'Select Language'**
  String get selectLanguage;

  /// No description provided for @security.
  ///
  /// In en, this message translates to:
  /// **'Security'**
  String get security;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @help.
  ///
  /// In en, this message translates to:
  /// **'Help'**
  String get help;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @tapToEdit.
  ///
  /// In en, this message translates to:
  /// **'Tap To Edit'**
  String get tapToEdit;

  /// No description provided for @yourWeight.
  ///
  /// In en, this message translates to:
  /// **'Your Weight'**
  String get yourWeight;

  /// No description provided for @yourGoal.
  ///
  /// In en, this message translates to:
  /// **'Your Goal'**
  String get yourGoal;

  /// No description provided for @yourActivityLevel.
  ///
  /// In en, this message translates to:
  /// **'Your Activity Level'**
  String get yourActivityLevel;

  /// No description provided for @selectImage.
  ///
  /// In en, this message translates to:
  /// **'Select Image'**
  String get selectImage;

  /// No description provided for @camera.
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get camera;

  /// No description provided for @gallery.
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get gallery;

  /// No description provided for @profileUpdatedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Profile updated successfully'**
  String get profileUpdatedSuccessfully;

  /// No description provided for @profilePhotoUpdatedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Profile photo updated successfully'**
  String get profilePhotoUpdatedSuccessfully;

  /// No description provided for @firstNameUpdatedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'First name updated successfully'**
  String get firstNameUpdatedSuccessfully;

  /// No description provided for @lastNameUpdatedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Last name updated successfully'**
  String get lastNameUpdatedSuccessfully;

  /// No description provided for @emailUpdatedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Email updated successfully'**
  String get emailUpdatedSuccessfully;

  /// No description provided for @weightUpdatedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Weight updated successfully'**
  String get weightUpdatedSuccessfully;

  /// No description provided for @goalUpdatedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Goal updated successfully'**
  String get goalUpdatedSuccessfully;

  /// No description provided for @activityLevelUpdatedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Activity level updated successfully'**
  String get activityLevelUpdatedSuccessfully;

  /// No description provided for @askAnything.
  ///
  /// In en, this message translates to:
  /// **'Ask anything'**
  String get askAnything;

  /// No description provided for @noPreviousConversations.
  ///
  /// In en, this message translates to:
  /// **'No Previous Conversations'**
  String get noPreviousConversations;

  /// No description provided for @previousConversations.
  ///
  /// In en, this message translates to:
  /// **'Previous Conversations'**
  String get previousConversations;

  /// No description provided for @newChat.
  ///
  /// In en, this message translates to:
  /// **'New Chat'**
  String get newChat;

  /// No description provided for @or.
  ///
  /// In en, this message translates to:
  /// **'or'**
  String get or;

  /// No description provided for @loseWeight.
  ///
  /// In en, this message translates to:
  /// **'Lose Weight'**
  String get loseWeight;

  /// No description provided for @gainWeight.
  ///
  /// In en, this message translates to:
  /// **'Gain Weight'**
  String get gainWeight;

  /// No description provided for @getFitter.
  ///
  /// In en, this message translates to:
  /// **'Get Fitter'**
  String get getFitter;

  /// No description provided for @getMoreFlexible.
  ///
  /// In en, this message translates to:
  /// **'Get More Flexible'**
  String get getMoreFlexible;

  /// No description provided for @learnTheBasic.
  ///
  /// In en, this message translates to:
  /// **'Learn The Basics'**
  String get learnTheBasic;

  /// No description provided for @rookie.
  ///
  /// In en, this message translates to:
  /// **'Rookie'**
  String get rookie;

  /// No description provided for @beginner.
  ///
  /// In en, this message translates to:
  /// **'Beginner'**
  String get beginner;

  /// No description provided for @intermediate.
  ///
  /// In en, this message translates to:
  /// **'Intermediate'**
  String get intermediate;

  /// No description provided for @advanced.
  ///
  /// In en, this message translates to:
  /// **'Advanced'**
  String get advanced;

  /// No description provided for @trueBeast.
  ///
  /// In en, this message translates to:
  /// **'True Beast'**
  String get trueBeast;

  /// No description provided for @noContentError.
  ///
  /// In en, this message translates to:
  /// **'No content available.'**
  String get noContentError;

  /// No description provided for @badRequestError.
  ///
  /// In en, this message translates to:
  /// **'Bad request. Please check your input.'**
  String get badRequestError;

  /// No description provided for @unAuthenticationError.
  ///
  /// In en, this message translates to:
  /// **'Authentication failed. Please login again.'**
  String get unAuthenticationError;

  /// No description provided for @forbiddenError.
  ///
  /// In en, this message translates to:
  /// **'Access forbidden.'**
  String get forbiddenError;

  /// No description provided for @internalServerError.
  ///
  /// In en, this message translates to:
  /// **'Internal server error. Please try again later.'**
  String get internalServerError;

  /// No description provided for @nameRequired.
  ///
  /// In en, this message translates to:
  /// **'Name is required'**
  String get nameRequired;

  /// No description provided for @nameMinLength.
  ///
  /// In en, this message translates to:
  /// **'Name must be at least 3 characters'**
  String get nameMinLength;

  /// No description provided for @nameMaxLength.
  ///
  /// In en, this message translates to:
  /// **'Name must be less than 20 characters'**
  String get nameMaxLength;

  /// No description provided for @nameNoNumbers.
  ///
  /// In en, this message translates to:
  /// **'Name must not contain numbers'**
  String get nameNoNumbers;

  /// No description provided for @emailRequired.
  ///
  /// In en, this message translates to:
  /// **'Email is required'**
  String get emailRequired;

  /// No description provided for @invalidEmail.
  ///
  /// In en, this message translates to:
  /// **'Invalid email address'**
  String get invalidEmail;

  /// No description provided for @passwordRequired.
  ///
  /// In en, this message translates to:
  /// **'Password is required'**
  String get passwordRequired;

  /// No description provided for @invalidPassword.
  ///
  /// In en, this message translates to:
  /// **'Invalid password'**
  String get invalidPassword;

  /// No description provided for @confirmPasswordRequired.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password is required'**
  String get confirmPasswordRequired;

  /// No description provided for @passwordsDoNotMatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwordsDoNotMatch;
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
