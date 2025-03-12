import 'package:get/get.dart';
import 'package:test_app/localization/languages/ar.dart';
import 'package:test_app/localization/languages/en.dart';

class AppLocalization implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {'en': en, 'ar': ar};
}
