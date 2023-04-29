import 'package:abc_tech_app/model/assist.dart';
import 'package:abc_tech_app/provider/assist_provider.dart';
import 'package:get/get.dart';

class AssistanceService extends GetxService {
  late AssistanceProviderInterface _assistanceProviderInterface;

  AssistanceService init(
    AssistanceProviderInterface providerInterface,
  ) {
    _assistanceProviderInterface = providerInterface;
    return this;
  }

  Future<List<Assist>> getAssists() async {
    Response response = await _assistanceProviderInterface.getAssists();

    if (response.hasError) {
      return Future.error(response.statusText.toString());
    }

    try {
      final List<dynamic> assists = response.body;

      return assists.map((assist) => Assist.fromMap(assist)).toList();
    } catch (e) {
      e.printError();
      return Future.error(e.toString());
    }
  }
}
