// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appName => 'Aevon';

  @override
  String get notFoundError => 'المورد غير موجود.';

  @override
  String get conflictError => 'حدث تعارض. يرجى المحاولة مرة أخرى.';

  @override
  String get apiLogicalError => 'أعاد API خطأ منطقيًا';

  @override
  String get connectTimeoutEreror => 'انتهت مهلة الاتصال';

  @override
  String get cancelError => 'تم إلغاء الطلب.';

  @override
  String get receiveTimeoutError => 'حدثت مهلة استلام';

  @override
  String get sendTimeoutError => 'حدثت مهلة إرسال.';

  @override
  String get cacheError => 'حدث خطأ في التخزين المؤقت.';

  @override
  String get noInternetConnectionError => 'لا يوجد اتصال بالإنترنت';

  @override
  String get defaultError => 'حدث خطأ غير متوقع.';

  @override
  String get onboardingdescription =>
      'هذا نص تجريبي لملء المحتوى. يتم استخدامه لعرض شكل النص دون معنى حقيقي.';

  @override
  String onboardingMessage(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'هذا نص تجريبي لملء المحتوى. يتم استخدامه لعرض شكل النص دون معنى حقيقي.',
      one: 'لم تكن اللياقة البدنية\nممتعة إلى هذا الحد من قبل',
      zero: 'ثمن التميز\nهو الانضباط',
    );
    return '$_temp0';
  }

  @override
  String get firstName => 'الاسم الاول';

  @override
  String get lastName => 'الاسم الاخير';

  @override
  String get next => 'التالي';

  @override
  String get back => 'السابق';

  @override
  String get doIt => 'افعلها';

  @override
  String get skip => 'تخطي';

  @override
  String get male => 'ذكر';

  @override
  String get female => 'انثى';

  @override
  String get year => 'سنوات';

  @override
  String get kg => 'كغ';

  @override
  String get cm => 'سم';

  @override
  String get heyThere => 'مرحبا';

  @override
  String get welecomeBack => 'مرحبا بكم مرة اخرى';

  @override
  String get email => 'البريد الالكتروني';

  @override
  String get password => 'كلمة المرور';

  @override
  String get forgetPassword => 'نسيت كلمة المرور';

  @override
  String get confirmPassword => 'تاكيد كلمة المرور';

  @override
  String get signIn => 'تسجيل الدخول';

  @override
  String get register => 'تسجيل حساب جديد';

  @override
  String get dontHaveAccount => ' لا تملك حساب ؟';

  @override
  String get alreadyHaveAccount => ' لديك حساب ؟ ';

  @override
  String get finish => 'انهاء';

  @override
  String signUpTitle(String step) {
    String _temp0 = intl.Intl.selectLogic(step, {
      '0': 'إنشاء حساب',
      '1': 'أخبرنا عن نفسك',
      '2': 'كم عمرك',
      '3': 'ما وزنك',
      '4': 'ما طولك',
      '5': 'ما هو هدفك',
      '6': 'ما هو مستوى نشاطك',
      'other': 'اختر الإجابة',
    });
    return '$_temp0';
  }

  @override
  String signUpSubtitle(String step) {
    String _temp0 = intl.Intl.selectLogic(step, {
      '0': 'مرحبًا',
      '1': 'نحتاج إلى معرفة جنسك',
      'other': 'هذا يساعدنا في إنشاء خطة شخصية لك',
    });
    return '$_temp0';
  }

  @override
  String forgetPasswordTitles(String page) {
    String _temp0 = intl.Intl.selectLogic(page, {
      '0': 'مرحبًا، نسيت كلمة المرور',
      '1': 'رمز التحقق',
      'other': 'أنشئ كلمة مرور جديدة',
    });
    return '$_temp0';
  }

  @override
  String forgetPasswordSubtitles(String page) {
    String _temp0 = intl.Intl.selectLogic(page, {
      '0': 'ادخل البريد الالكتروني',
      '1': 'ادخل رمز التحقق, المرسل على البريد الالكتروني',
      'other': 'ادخل كلمة المرور الجديدة',
    });
    return '$_temp0';
  }

  @override
  String get sendOtp => 'ارسل رمز التحقق';

  @override
  String get verify => 'تاكيد';

  @override
  String get rePassword => 'تاكيد كلمة المرور';

  @override
  String get didntReceiveCode => 'لم يتم الاستلام منك رمز التحقق';

  @override
  String get resendCode => 'ارسل رمز التحقق مرة اخرى';

  @override
  String get chatOnboardingBottomSheetTitle => 'كيف يمكنني مساعدتك\n اليوم؟';

  @override
  String get getStarted => 'ابدأ';

  @override
  String get hi => 'مرحبًا';

  @override
  String get chatOnboardingHeaderTitle => 'أنا مدربك الذكي';

  @override
  String get chatHeaderTitle => 'المدرب الذكي';

  @override
  String get explore => 'استكشاف';

  @override
  String get chat => 'المحادثة';

  @override
  String get workouts => 'التمارين';

  @override
  String get profile => 'الملف الشخصي';

  @override
  String get editProfile => 'تعديل الملف الشخصي';

  @override
  String get changePassword => 'تغيير كلمة المرور';

  @override
  String get selectLanguage => 'اختر اللغة';

  @override
  String get security => 'الأمان';

  @override
  String get privacyPolicy => 'سياسة الخصوصية';

  @override
  String get help => 'المساعدة';

  @override
  String get logout => 'تسجيل الخروج';

  @override
  String get tapToEdit => 'اضغط للتعديل';

  @override
  String get yourWeight => 'وزنك';

  @override
  String get yourGoal => 'هدفك';

  @override
  String get yourActivityLevel => 'مستوى نشاطك';

  @override
  String get selectImage => 'اختر صورة';

  @override
  String get camera => 'الكاميرا';

  @override
  String get gallery => 'معرض الصور';

  @override
  String get profileUpdatedSuccessfully => 'تم تحديث الملف الشخصي بنجاح';

  @override
  String get profilePhotoUpdatedSuccessfully => 'تم تحديث الصورة الشخصية بنجاح';

  @override
  String get firstNameUpdatedSuccessfully => 'تم تحديث الاسم الأول بنجاح';

  @override
  String get lastNameUpdatedSuccessfully => 'تم تحديث الاسم الأخير بنجاح';

  @override
  String get emailUpdatedSuccessfully => 'تم تحديث البريد الإلكتروني بنجاح';

  @override
  String get weightUpdatedSuccessfully => 'تم تحديث الوزن بنجاح';

  @override
  String get goalUpdatedSuccessfully => 'تم تحديث الهدف بنجاح';

  @override
  String get activityLevelUpdatedSuccessfully => 'تم تحديث مستوى النشاط بنجاح';

  @override
  String get askAnything => 'اسأل عن أي شيء';

  @override
  String get noPreviousConversations => 'لا توجد محادثات سابقة';

  @override
  String get previousConversations => 'المحادثات السابقة';

  @override
  String get newChat => 'محادثة جديدة';

  @override
  String get or => 'أو';

  @override
  String get loseWeight => 'إنقاص الوزن';

  @override
  String get gainWeight => 'زيادة الوزن';

  @override
  String get getFitter => 'زيادة اللياقة';

  @override
  String get getMoreFlexible => 'زيادة المرونة';

  @override
  String get learnTheBasic => 'تعلم الأساسيات';

  @override
  String get rookie => 'مبتدئ جداً';

  @override
  String get beginner => 'مبتدئ';

  @override
  String get intermediate => 'متوسط';

  @override
  String get advanced => 'متقدم';

  @override
  String get trueBeast => 'محترف';

  @override
  String get noContentError => 'لا يوجد محتوى متاح.';

  @override
  String get badRequestError => 'طلب غير صالح. يرجى التحقق من المدخلات.';

  @override
  String get unAuthenticationError =>
      'فشل المصادقة. يرجى تسجيل الدخول مرة أخرى.';

  @override
  String get forbiddenError => 'الوصول محظور.';

  @override
  String get internalServerError =>
      'خطأ داخلي في الخادم. يرجى المحاولة مرة أخرى لاحقًا.';

  @override
  String get nameRequired => 'الاسم مطلوب';

  @override
  String get nameMinLength => 'يجب أن يتكون الاسم من 3 أحرف على الأقل';

  @override
  String get nameMaxLength => 'يجب أن يكون الاسم أقل من 20 حرفًا';

  @override
  String get nameNoNumbers => 'يجب ألا يحتوي الاسم على أرقام';

  @override
  String get emailRequired => 'البريد الإلكتروني مطلوب';

  @override
  String get invalidEmail => 'عنوان البريد الإلكتروني غير صالح';

  @override
  String get passwordRequired => 'كلمة المرور مطلوبة';

  @override
  String get invalidPassword => 'كلمة المرور غير صالحة';

  @override
  String get confirmPasswordRequired => 'تأكيد كلمة المرور مطلوب';

  @override
  String get passwordsDoNotMatch => 'كلمتا المرور غير متطابقتين';

  @override
  String get arabic => 'العربية';

  @override
  String get english => 'الانجليزية';
}
