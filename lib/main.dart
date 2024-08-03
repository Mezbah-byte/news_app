import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/core/error/app_bindings.dart';
import 'package:news_app/features/presentation/screens/splash/SplashScreen.dart';
import 'config/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Connectivity().checkConnectivity();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'News App',
        initialBinding: AppBindings(),
        initialRoute: Routes.splash,
        getPages: Routes.getPages,
        debugShowCheckedModeBanner: false,
      );
  }
}
