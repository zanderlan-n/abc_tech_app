import 'package:abc_tech_app/model/assist.dart';
import 'package:abc_tech_app/service/geolocation_service.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'dart:developer';

class OrderController extends GetxController {
  final GeolocationServiceInterface _geolocationService;
  final formKey = GlobalKey<FormState>();
  final operatorIdController = TextEditingController();
  final selectedAssists = <Assist>[].obs;

  OrderController(this._geolocationService);

  @override
  void onInit() {
    super.onInit();
    _geolocationService.start();
  }

  getLocation() {
    _geolocationService
        .getPosition()
        .then((value) => log(value.toJson().toString()));
  }
}
