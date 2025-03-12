import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/controller/home_controller.dart';

class Third extends GetView<HomeController> {
  const Third({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Third')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have pushed the button this many times:'),
            Obx(
              () => Text(
                '${controller.count}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
            ElevatedButton(
              onPressed: () => Get.offNamed('/', arguments: 'Get is the best'),
              child: Text('GO TO Home'),
            ),
            ElevatedButton(
              onPressed:
                  () => Get.offAndToNamed(
                    "/NextScreen?device=phone&id=354&name=Enzo",
                  ),
              child: Text('Go to non-defined routes'),
            ),
          ],
        ),
      ),
    );
  }
}
