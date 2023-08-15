import 'package:get/get.dart';
import 'package:mindpad/app/pages/home/bindings/home_bindings.dart';
import 'package:mindpad/app/pages/notes/views/editnote/editnote.dart';

import '../pages/home/views/home_view.dart';
import '../pages/splashscreen/binding/splashscreen_binding.dart';
import '../pages/splashscreen/view/splashscreen_view.dart';

class AppRouter {
  static List<GetPage> routes = [
    GetPage(
      name: '/',
      page: () => const SplashScreenView(),
      binding: SplashscreenBinding(),
    ),
    GetPage(
      name: '/home',
      page: () => HomeView(),
      transition: Transition.fadeIn,
      binding: HomeBinding(),
    ),
    GetPage(
      name: '/editNote',
      page: () => EditNotePage(),
    ),
  ];
}
