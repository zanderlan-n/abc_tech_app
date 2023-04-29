import 'package:abc_tech_app/controller/login_controller.dart';
import 'package:get/get.dart';

class LoginBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
