class AppKeys {
  AppKeys._();
  static const String localeKey = 'locale_code';
  static const String englishLocale = 'en';
  static const String arabicLocale = 'ar';
  static const String seenOnboarding = "seenOnboarding";
  static const String token = "token";
  static const String userInfo = "userInfo";
  static const String chatOnboardingSeen = "chatOnboardingSeen";
}

class ApiConstants {
  ApiConstants._();
  static const String baseUrl = 'https://fitness.elevateegy.com/api/v1/';

  // Authentication Endpoints
  static const String authBaseUrl = 'auth/';
  static const String signIn = '${authBaseUrl}signin';
  static const String signUp = '${authBaseUrl}signup';
  static const String changePassword = '${authBaseUrl}change-password';
  static const String forgetPassword = '${authBaseUrl}forgotPassword';
  static const String uploadProfilePhoto = '${authBaseUrl}upload-photo';
  static const String getProfile = '${authBaseUrl}profile-data';
  static const String logout = '${authBaseUrl}logout';
  static const String verifyCode = '${authBaseUrl}verifyResetCode';
  static const String resetPassword = '${authBaseUrl}resetPassword';
  static const String deleteAcount = '${authBaseUrl}deleteMe';
  static const String editProfile = '${authBaseUrl}editProfile';
  static const String tokenAuth = 'Authorization';
  static const String responseLang = "accept-language";

  // Chat Endpoints
  static const String aiChatEndpoint =
      'https://api.openai.com/v1/chat/completions';

  //Firestore Endpoints
  static const String usersCollection = 'users';
  static const String conversationsCollection = 'conversations';

  //Muscle Endpoints
  static const String allMuscleGroups = '${baseUrl}muscles';
}
