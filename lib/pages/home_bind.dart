import 'package:abc_tech_app/controller/assist_controller.dart';
import 'package:get/instance_manager.dart';

class HomeBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AssistController>(() => AssistController());
  }
}
