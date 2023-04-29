import 'package:abc_tech_app/model/assist.dart';
import 'package:abc_tech_app/service/assist_service.dart';
import 'package:get/get.dart';

class AssistanceController extends GetxController
    with StateMixin<List<Assist>> {
  late AssistanceService _assistanceService;
  @override
  void onInit() {
    super.onInit();
    _assistanceService = Get.find<AssistanceService>();
    getAssistanceList();
  }

  void getAssistanceList() {
    change(null, status: RxStatus.loading());
    _assistanceService.getAssists().then((value) {
      change(value, status: RxStatus.success());
    }, onError: (error) {
      change([], status: RxStatus.error(error.toString()));
    });
  }
}
