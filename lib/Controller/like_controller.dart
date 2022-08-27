import 'package:get/get.dart';

class LikeController extends GetxController {
  RxList likeList = [].obs;
  RxInt index = 0.obs;
  RxInt stackIndex = 0.obs;

  // list에 값이 없어야만 추가를 해주게 만들었음.
  void likeAdd(index) {
    if (likeList.contains(1)) {
      if (likeList.contains(index)) {
        stackIndex(0); //여긴 없어도 되는데 혹시 몰라서 안정성을 위해 해놓음.
        printList();
      } else {
        likeList.add(index);
        likeList.remove(1);
        stackIndex(1);
        printList();
      }
    } else {
      if (likeList.contains(index)) {
        printList();
      } else {
        likeList.add(index);
        printList();
      }
    }
  }

  void likeRemove(index) {
    if (likeList.length == 1) {
      likeList.add(1);
      stackIndex(0);
      likeList.remove(index);
      printList();
    } else {
      likeList.remove(index);
      printList();
    }
  }

  void printList() {
    print(likeList);
  }
}
