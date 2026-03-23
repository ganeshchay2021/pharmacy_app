import 'package:get/get.dart';
import 'package:pharmacy_app/controller/route_controller.dart';

class ControllerBindings extends Bindings{
  @override
  void dependencies() {
    //route controller
    Get.put<RouteController>(RouteController(), permanent: true);
  }
}