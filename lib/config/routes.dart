import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/features/presentation/screens/home/HomeScreen.dart';
import 'package:news_app/features/presentation/screens/splash/SplashScreen.dart';
import 'package:news_app/features/presentation/screens/story_screen/story_screen.dart';
class Routes {
  static const String splash = '/';
  static const String home = '/home';
  static const String story = '/story';

  static List<GetPage> getPages = [
    GetPage(name: splash, page: () => SplashScreen()),
    GetPage(name: home, page: ()=>HomeScreen()),
    GetPage(name: story, page: () => StoryScreen()),
  ];
}
