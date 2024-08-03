import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/features/presentation/controller/splash/splashController.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  SplashController splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset('assets/anim/newsAnim.json', width: 200, height: 200),
      ),
    );
  }
}