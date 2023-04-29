import 'package:abc_tech_app/service/login_service.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final LoginService _loginService = LoginService();

  String code = '';

  Future<void> login() async {
    if (code.isNotEmpty) {
      bool isValidCode = await _loginService.validateCode(code);
      if (isValidCode) {
        Get.offNamed('/home');
        return;
      }

      Get.snackbar('Erro', 'Código inválido');
      return;
    }

    Get.snackbar('Erro', 'Por favor, insira um código');
  }
}
