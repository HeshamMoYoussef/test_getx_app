import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  final count = 0.obs;

  String name = '';
  GetStorage box = GetStorage();
  @override
  void onInit() {
    /// when the controller is initialized
    super.onInit();
    log('onInit');
  }

  @override
  void onReady() {
    /// when the controller is onReady
    log('onReady');
    super.onReady();
  }

  @override
  void onClose() {
    /// when the controller is onClose
    log('onClose');
    super.onClose();
  }

  void displayName() {
    name = 'Hesham';
    box.write('name', name);
    log(name);
    update();
  }

  void getName() {
    String name = box.read('name') ?? 'has been Deleted';
    log(name);
    update();
  }

  void deleteName() {
    box.remove('name');
    name = '';
    log('name deleted');
    update();
  }

  // void printParameters() {
  //   log(Get.parameters['id'] ?? '');
  //   // out: 354
  //   log(Get.parameters['name'] ?? '');
  //   // out: Enzo
  // }

  void increment() {
    if (count.value >= 0) {
      count.value++;
    } else {
      count.value = 0;
    }
  }

  void decrement() {
    if (count.value > 0) {
      count.value--;
    } else {
      count.value = 0;
    }
  }
}
