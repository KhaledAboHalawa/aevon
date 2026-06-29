class AppKeys {
  AppKeys._();
  static const String localeKey = 'locale_code';
  static const String englishLocale = 'en';
  static const String arabicLocale = 'ar';
}
class ApiConstants {
  ApiConstants._();
  static const String baseUrl = 'https://fitness.elevateegy.com/api/v1/';

  // Authentication Endpoints
  static const String authBaseUrl = 'auth/';
  static const String signIn = '${authBaseUrl}login';
  static const String signUp = '${authBaseUrl}signup';
  static const String changePassword = '${authBaseUrl}change-password';
  static const String forgotPassword = '${authBaseUrl}forgotPassword';
  static const String uploadProfilePhoto = '${authBaseUrl}upload-photo';
  static const String getProfile = '${authBaseUrl}profile-data';
  static const String logout = '${authBaseUrl}logout';
  static const String verifyCode = '${authBaseUrl}verifyResetCode';
  static const String resetPassword = '${authBaseUrl}resetPassword';
  static const String deleteAcount = '${authBaseUrl}deleteMe';
  static const String editProfile = '${authBaseUrl}editProfile';




}
 