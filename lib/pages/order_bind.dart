import 'package:abc_tech_app/controller/order_controller.dart';
import 'package:abc_tech_app/provider/order_provider.dart';
import 'package:abc_tech_app/services/geolocation_service.dart';
import 'package:abc_tech_app/services/order_service.dart';
import 'package:get/get.dart';

class OrderBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderController>(() =>
        OrderController(GeolocationService(), OrderService(OrderProvider())));
  }
}
