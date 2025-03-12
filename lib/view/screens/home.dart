import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:test_app/controller/home_controller.dart';

class MyHomePage extends GetView<HomeController> {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<HomeController>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Learning GetX Navigation App'),
        centerTitle: true,
        elevation: 1,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Spacer(flex: 1),
            Text('You have pushed the button this many times:'),
            Obx(
              () => Text(
                '${controller.count}',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: controller.increment,
                  child: Text('Increment'),
                ),
                ElevatedButton(
                  onPressed: controller.decrement,
                  child: Text('Decrement'),
                ),
              ],
            ),
            Spacer(flex: 1),

            GetBuilder<HomeController>(
              // init: HomeController(),
              builder: (controller) {
                return Text(
                  controller.name,
                  style: Theme.of(context).textTheme.headlineLarge,
                );
              },
            ),
            Spacer(flex: 1),

            ElevatedButton(
              onPressed: () {
                controller.displayName();
              },
              child: Text('Display Name'),
            ),
            Spacer(flex: 1),

            ElevatedButton(
              onPressed: () {
                controller.getName();
              },
              child: Text('Get Name'),
            ),
            Spacer(flex: 1),

            ElevatedButton(
              onPressed: () {
                controller.deleteName();
              },
              child: Text('Delete Name'),
            ),
            Spacer(flex: 1),

            Text('Hello'.tr, style: Theme.of(context).textTheme.headlineLarge),
            Spacer(flex: 1),

            Text(
              'Home Screen'.tr +
                  (Get.locale?.toString() == 'en' ? 'English'.tr : 'Arabic'.tr),
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Spacer(flex: 1),

            ElevatedButton(
              onPressed: () {
                GetStorage box = GetStorage();
                if (Get.locale == const Locale('en')) {
                  Get.updateLocale(const Locale('ar'));
                  box.write('lang', 'ar');
                } else {
                  Get.updateLocale(const Locale('en'));
                  box.write('lang', 'en');
                }
              },
              child: Text('Change Language'.tr),
            ),
            Spacer(flex: 2),
            ElevatedButton(
              onPressed: () => Get.toNamed('/second'),
              child: Text('Go TO Second'),
            ),
            Spacer(flex: 2),
            ElevatedButton(
              onPressed: () => Get.toNamed('/third'),
              child: Text('Go TO Third'),
            ),
            Spacer(flex: 4),
          ],
        ),
      ),
    );
  }
}
