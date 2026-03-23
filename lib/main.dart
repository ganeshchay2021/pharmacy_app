import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy_app/bindings/controller_bindings.dart';
import 'package:pharmacy_app/routes/app_pages.dart';
import 'package:pharmacy_app/view/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Pharmacy',
      initialBinding: ControllerBindings(),
      getPages: AppPages.routes,
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
      home: HomeView(),
    );
  }
}
