import 'package:get/get.dart';
import 'package:sds_new/Home.dart';

import '../Category.dart';
import '../Setting.dart';

enum PageName { HISTORY, HOME, SETTING }

class BottomNavContoroller extends GetxController {
  RxInt pageIndex = 1.obs;

  void changeBottomNav(int value) {
    var page = PageName.values[value];
    switch (page) {
      case PageName.HISTORY:
        _changePage(value);
        Get.to(Category(), transition: Transition.noTransition);
        break;
      case PageName.HOME:
        _changePage(value);
        Get.to(Home(), transition: Transition.noTransition);
        break;
      case PageName.SETTING:
        _changePage(value);
        Get.to(Setting(), transition: Transition.noTransition);
        break;
    }
  }

  void _changePage(int value) {
    pageIndex(value);
  }
}
