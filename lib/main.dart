import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:test_app/bindings/home_binding.dart';
import 'package:test_app/localization/app_localization.dart';
import 'package:test_app/view/screens/second.dart';
import 'package:test_app/view/screens/third.dart';

import 'view/screens/home.dart';
import 'view/screens/unknown_route_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HomeBinding().dependencies();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    GetStorage box = GetStorage();
    // print(box.read('lang'));
    return GetMaterialApp(
      locale:
          (box.read('lang') == null)
              ? const Locale('en')
              : Locale(box.read('lang')),
      translations: AppLocalization(),
      debugShowCheckedModeBanner: false,
      initialBinding: HomeBinding(),
      initialRoute: '/',
      unknownRoute: GetPage(name: '/notfound', page: () => UnknownRoutePage()),
      getPages: [
        GetPage(name: '/', page: () => MyHomePage()),
        GetPage(name: '/second', page: () => Second()),
        GetPage(
          name: '/third',
          page: () => Third(),
          transition: Transition.downToUp,
        ),
      ],
    );
  }
}
