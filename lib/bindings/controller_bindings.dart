import 'package:get/get.dart';
import 'package:pharmacy_app/controller/admin_comtroller.dart';
import 'package:pharmacy_app/controller/auth_controller.dart';
import 'package:pharmacy_app/controller/product_controller.dart';

class ControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController(), permanent: true);
    Get.put<AdminController>(AdminController(), permanent: true);
    Get.put<ProductController>(ProductController(), permanent: true);


  }
}
