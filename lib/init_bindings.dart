import 'package:get/get.dart';
import 'package:sds_new/Controller/bottom_nav_controller.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavContoroller(), permanent: true);
    // Get.put(LikeController(), permanent: true);
  }
}
