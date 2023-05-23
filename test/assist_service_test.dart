import 'dart:convert';
import 'dart:io';

import 'package:abc_tech_app/model/assist.dart';
import 'package:abc_tech_app/provider/assist_provider.dart';
import 'package:abc_tech_app/services/assist_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get_connect.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'assist_service_test.mocks.dart';

@GenerateMocks([AssistProviderInterface])
void main() {
  late AssistProviderInterface assistanceProviderInterface;
  late AssistService assistanceService;

  setUp(() async {
    assistanceProviderInterface = MockAssistProviderInterface();
    assistanceService =
        AssistService(assistProvider: assistanceProviderInterface);
    var json = File("${Directory.current.path}/test/resources/assists.json")
        .readAsStringSync();

    when(assistanceProviderInterface.getAssists())
        .thenAnswer((_) async => Future.sync(() => Response(
              statusCode: 200,
              body: jsonDecode(json),
            )));
  });

  test("Teste de listagem de assistencias", () async {
    List<Assist> assists = await assistanceService.getAssists();
    expect(assists.length, 2);
    expect(assists[0].id, 1);
    expect(assists[0].title, "Troca de aparelho");
    expect(assists[0].description, "Troca de aparelho decodificador");
  });
}
