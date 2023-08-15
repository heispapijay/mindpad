import 'package:get/get.dart';

class SplashscreenController extends GetxController {
  //TODO: Implement SplashscreenController

  final count = 0.obs;
  @override
  void onInit() async {
    await Future.delayed(Duration(seconds: 3));
    Get.offAllNamed('/home');

    super.onInit();
  }

  void increment() => count.value++;
}
