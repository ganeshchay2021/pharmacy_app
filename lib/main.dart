import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:pharmacy_app/bindings/controller_bindings.dart';
import 'package:pharmacy_app/routes/app_pages.dart';
import 'package:pharmacy_app/view/botton_nav.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return KhaltiScope(
      publicKey: "test_public_key_d5d9f63743584dc38753056b0cc737d5",
      builder: (context, navigatorKey) {
        return GetMaterialApp(
          navigatorKey: navigatorKey,
          supportedLocales: const [Locale('en', 'US')],
          localizationsDelegates: const [KhaltiLocalizations.delegate],
          title: 'Pharmacy',
          initialBinding: ControllerBindings(),
          getPages: AppPages.routes,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            tabBarTheme: TabBarThemeData(
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white70,
              indicator: const UnderlineTabIndicator(
                borderSide: BorderSide(color: Colors.white, width: 2),
              ),
            ),
          ),
          home: const BottonNav(),
        );
      },
    );
  }
}


// GetMaterialApp(
//         title: 'Pharmacy',
//         initialBinding: ControllerBindings(),
//         getPages: AppPages.routes,
//         theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
//         home: BottonNav(),
//       ),