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
  String get kg => 'KG';

  @override
  String get cm => 'CM';

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

  @override
  String forgetPasswordTitles(String page) {
    String _temp0 = intl.Intl.selectLogic(page, {
      '0': 'Forget password',
      '1': 'OTP CODE',
      'other': 'Create New Password',
    });
    return '$_temp0';
  }

  @override
  String forgetPasswordSubtitles(String page) {
    String _temp0 = intl.Intl.selectLogic(page, {
      '0': 'Enter Your Email',
      '1': 'Enter Your OTP Check your email',
      'other': 'Create New Password',
    });
    return '$_temp0';
  }

  @override
  String get sendOtp => 'Send OTP';

  @override
  String get verify => 'Verify';

  @override
  String get rePassword => 'Re-Password';

  @override
  String get didntReceiveCode => 'Didn\'t Receive Verification Code?';

  @override
  String get resendCode => 'Resend Code';

  @override
  String get chatOnboardingBottomSheetTitle => 'How Can I Assist You\n Today?';

  @override
  String get getStarted => 'Get Started';

  @override
  String get hi => 'Hi';

  @override
  String get chatOnboardingHeaderTitle => 'I am your smart coach';

  @override
  String get chatHeaderTitle => 'Smart Coach';

  @override
  String get explore => 'Explore';

  @override
  String get chat => 'Chat';

  @override
  String get workouts => 'Workouts';

  @override
  String get profile => 'Profile';

  @override
  String get editProfile => 'Edit Profile';

  @override
  String get changePassword => 'Change Password';

  @override
  String get selectLanguage => 'Select Language';

  @override
  String get security => 'Security';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get help => 'Help';

  @override
  String get logout => 'Logout';

  @override
  String get tapToEdit => 'Tap To Edit';

  @override
  String get yourWeight => 'Your Weight';

  @override
  String get yourGoal => 'Your Goal';

  @override
  String get yourActivityLevel => 'Your Activity Level';

  @override
  String get selectImage => 'Select Image';

  @override
  String get camera => 'Camera';

  @override
  String get gallery => 'Gallery';

  @override
  String get profileUpdatedSuccessfully => 'Profile updated successfully';

  @override
  String get profilePhotoUpdatedSuccessfully =>
      'Profile photo updated successfully';

  @override
  String get firstNameUpdatedSuccessfully => 'First name updated successfully';

  @override
  String get lastNameUpdatedSuccessfully => 'Last name updated successfully';

  @override
  String get emailUpdatedSuccessfully => 'Email updated successfully';

  @override
  String get weightUpdatedSuccessfully => 'Weight updated successfully';

  @override
  String get goalUpdatedSuccessfully => 'Goal updated successfully';

  @override
  String get activityLevelUpdatedSuccessfully =>
      'Activity level updated successfully';

  @override
  String get askAnything => 'Ask anything';

  @override
  String get noPreviousConversations => 'No Previous Conversations';

  @override
  String get previousConversations => 'Previous Conversations';

  @override
  String get newChat => 'New Chat';

  @override
  String get or => 'or';

  @override
  String get loseWeight => 'Lose Weight';

  @override
  String get gainWeight => 'Gain Weight';

  @override
  String get getFitter => 'Get Fitter';

  @override
  String get getMoreFlexible => 'Get More Flexible';

  @override
  String get learnTheBasic => 'Learn The Basics';

  @override
  String get rookie => 'Rookie';

  @override
  String get beginner => 'Beginner';

  @override
  String get intermediate => 'Intermediate';

  @override
  String get advanced => 'Advanced';

  @override
  String get trueBeast => 'True Beast';

  @override
  String get noContentError => 'No content available.';

  @override
  String get badRequestError => 'Bad request. Please check your input.';

  @override
  String get unAuthenticationError =>
      'Authentication failed. Please login again.';

  @override
  String get forbiddenError => 'Access forbidden.';

  @override
  String get internalServerError =>
      'Internal server error. Please try again later.';

  @override
  String get nameRequired => 'Name is required';

  @override
  String get nameMinLength => 'Name must be at least 3 characters';

  @override
  String get nameMaxLength => 'Name must be less than 20 characters';

  @override
  String get nameNoNumbers => 'Name must not contain numbers';

  @override
  String get emailRequired => 'Email is required';

  @override
  String get invalidEmail => 'Invalid email address';

  @override
  String get passwordRequired => 'Password is required';

  @override
  String get invalidPassword => 'Invalid password';

  @override
  String get confirmPasswordRequired => 'Confirm Password is required';

  @override
  String get passwordsDoNotMatch => 'Passwords do not match';

  @override
  String get arabic => 'Arabic';

  @override
  String get english => 'English';
}
