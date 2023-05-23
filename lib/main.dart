import 'package:abc_tech_app/pages/home_bind.dart';
import 'package:abc_tech_app/pages/home_page.dart';
import 'package:abc_tech_app/pages/order_bind.dart';
import 'package:abc_tech_app/pages/order_page.dart';
import 'package:abc_tech_app/provider/assist_provider.dart';
import 'package:abc_tech_app/services/assist_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  initServices();
  runApp(const MyApp());
}

void initServices() {
  Get.lazyPut(() => AssistService(assistProvider: AssistProvider()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Abc Tech App',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme:
              const TextTheme(headlineMedium: TextStyle(color: Colors.yellow))),
      getPages: [
        GetPage(name: "/", page: () => const OrderPage(), binding: OrderBind()),
        GetPage(
            name: "/assists", page: () => const HomePage(), binding: HomeBind())
      ],
    );
  }
}
