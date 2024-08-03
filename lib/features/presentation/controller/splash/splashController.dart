import 'package:get/get.dart';
import 'package:news_app/config/routes.dart';

class SplashController extends GetxController{
  
  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    Future.delayed(const Duration(seconds: 3), () async {
          Get.offNamed(Routes.home); 
  });
  }
}