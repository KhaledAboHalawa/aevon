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
  String get next => 'التالي';

  @override
  String get back => 'السابق';

  @override
  String get doIt => 'افعلها';

  @override
  String get skip => 'تخطي';
}
