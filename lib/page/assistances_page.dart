import 'package:abc_tech_app/controller/assistance_controller.dart';
import 'package:abc_tech_app/model/assist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AssistanceListPage extends GetView<AssistanceController> {
  const AssistanceListPage({super.key});

  Widget _renderAssists(List<Assist> assists) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: assists.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            assists[index].title,
            textAlign: TextAlign.center,
          ),
          subtitle: Text(
            assists[index].description,
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Assistências"),
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: const [
                  Expanded(
                    child: Text(
                      "Os serviços disponíveis são:",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  )
                ],
              ),
              controller.obx(
                (state) => _renderAssists(state ?? []),
                onLoading: const CircularProgressIndicator(),
                onError: (error) => Text(error.toString()),
                onEmpty: const Text("Nenhuma assistência encontrada"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
