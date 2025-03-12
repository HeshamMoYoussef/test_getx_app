import 'package:get/get.dart';
import 'package:test_app/controller/home_controller.dart';
import 'package:test_app/controller/second_controller.dart';

// Bindings Class to Initialize and Inject the Controller by Dependency Injection
class HomeBinding implements Bindings {
  @override
  void dependencies() {
    // Get.put(HomeController());
    //  D I
    //  permanent: true >> to save data in the memory values will not be lost
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => SecondController(), fenix: true);
  }
}
