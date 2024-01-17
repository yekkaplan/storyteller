import 'package:get/get.dart';
import 'package:getx_skeleton/app/modules/home/views/home_view.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();

    Future.delayed(Duration(seconds: 3), () {
      Get.to(() => HomeView());
    });
  }
}
