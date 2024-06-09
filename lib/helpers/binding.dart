import 'package:get/get.dart';
import '../controllers/AccountRecovery_controller.dart';
import '../controllers/AppController.dart';
import '../controllers/Driver_controller.dart';
import '../controllers/User_controller.dart';
class Binding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(()=>AppController());
    Get.lazyPut(()=>AccountRecoveryController());
    Get.lazyPut(()=>UserController());
    Get.lazyPut(()=>DriverController());

  }
}
