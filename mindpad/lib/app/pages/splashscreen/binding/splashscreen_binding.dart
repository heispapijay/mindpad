import 'package:get/get.dart';

import '../controller/splashscreen_controller.dart';

class SplashscreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      SplashscreenController(),
    );
  }
}
