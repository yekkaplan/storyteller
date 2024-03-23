import 'package:get/get.dart';
import 'package:getx_skeleton/app/modules/read/controllers/read_controller.dart';

class ReadBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReadController>(
      () => ReadController(),
    );
  }
}
