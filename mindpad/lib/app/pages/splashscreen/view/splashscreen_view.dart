import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindpad/app/pages/splashscreen/controller/splashscreen_controller.dart';

class SplashScreenView extends GetView<SplashscreenController> {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(
      SplashscreenController(),
    );

    return Scaffold(
      body: Center(
        child: Text('Splash Screen'),
      ),
    );
  }
}
