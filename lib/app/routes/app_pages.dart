import 'package:get/get.dart';
import 'package:getx_skeleton/app/modules/read/bindings/read_binding.dart';
import 'package:getx_skeleton/app/modules/read/views/read_view.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/splash/bindings/splash_bindings.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const INITIAL = Routes.SPLASH;
  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
        name: _Paths.SPLASH,
        page: () => const SplashView(),
        binding: SplashBinding()),
    GetPage(
        name: _Paths.READ, page: () => const ReadView(), binding: ReadBinding())
  ];
}
