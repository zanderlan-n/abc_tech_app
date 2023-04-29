import 'package:abc_tech_app/provider/default_http_client.dart';
import 'package:get/get_connect.dart';

abstract class AssistanceProviderInterface {
  Future<Response> getAssists();
}

class AssistanceProvider implements AssistanceProviderInterface {
  final DefaultHttpClient _httpClient = DefaultHttpClient();

  @override
  Future<Response> getAssists() => _httpClient.get('/assists');
}
