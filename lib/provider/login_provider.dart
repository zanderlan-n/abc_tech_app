import 'package:abc_tech_app/service/login_service.dart';

abstract class LoginProviderInterface {
  Future<bool> validateCode(String code);
}

class LoginProvider implements LoginProviderInterface {
  final LoginService _loginService = LoginService();

  @override
  Future<bool> validateCode(String code) => _loginService.validateCode(code);
}
