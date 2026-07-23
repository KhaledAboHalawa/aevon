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
  String get heyThere => 'مرحبا';

  @override
  String get welecomeBack => 'WELCOME BACK';

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
}
