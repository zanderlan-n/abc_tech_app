import 'package:abc_tech_app/controller/assistance_controller.dart';
import 'package:abc_tech_app/page/assistance_bind.dart';
import 'package:abc_tech_app/page/assistances_page.dart';
import 'package:abc_tech_app/page/login_bind.dart';
import 'package:abc_tech_app/page/login_page.dart';
import 'package:abc_tech_app/page/order_bind.dart';
import 'package:abc_tech_app/page/order_page.dart';
import 'package:abc_tech_app/provider/assist_provider.dart';
import 'package:abc_tech_app/service/assist_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void initServices() {
  Get.put<AssistanceService>(AssistanceService().init(AssistanceProvider()));
  Get.put<AssistanceController>(AssistanceController());
}

void main() {
  initServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        highlightColor: Colors.red,
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w300,
            color: Colors.blueGrey,
          ),
          headlineMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w300,
            color: Colors.blueGrey,
          ),
        ),
      ),
      getPages: [
        // GetPage(
        //   name: '/',
        //   page: () => const LoginPage(),
        //   binding: LoginBind(),
        // ),
        GetPage(
          name: '/',
          page: () => const OrderPage(),
          binding: OrderBinding(),
        ),
        GetPage(
          name: '/services',
          page: () => const AssistanceListPage(),
          binding: AssistanceBind(),
        ),
      ],
    );
  }
}
