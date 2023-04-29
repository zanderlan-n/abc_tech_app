import 'package:get/get_connect.dart';
import 'package:abc_tech_app/constants.dart';

class DefaultHttpClient extends GetConnect {
  DefaultHttpClient() {
    httpClient.baseUrl = Constants.baseUrl;
  }
}
