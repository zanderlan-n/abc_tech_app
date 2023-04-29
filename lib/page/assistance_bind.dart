import 'package:abc_tech_app/controller/assistance_controller.dart';
import 'package:get/get.dart';

class AssistanceBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AssistanceController());
  }
}
