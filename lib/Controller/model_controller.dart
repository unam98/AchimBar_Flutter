import 'package:get/get.dart';

class ModelController extends GetxController {
  RxDouble weight = 20.0.obs;
  RxDouble price = 1180.0.obs;
  RxDouble cook_time = 0.0.obs;
  RxDouble kcal = 0.0.obs;
  RxString imageValue = "image/fried-rice.png".obs;


  String modelReturn() {
    if (weight <= 254.5) {
      if (weight <= 201.5) {
        if (weight <= 62.5) {
          if (price <= 3090) {
            return 'CEREAL';
          } else {
            return 'CEREAL';
          }
        } else {
          if (price <= 5830) {
            return 'WATER';
          } else {
            return 'FASTFOOD';
          }
        }
      } else {
        if (cook_time <= 105) {
          if (cook_time <= 70) {
            return 'SALAD';
          } else {
            return 'WATER';
          }
        } else {
          if (weight <= 230.5) {
            return 'RICE';
          } else {
            return 'FASTFOOD';
          }
        }
      }
    } else {
      if (cook_time <= 285) {
        if (cook_time <= 10) {
          if (price <= 3790) {
            return 'FASTFOOD';
          } else {
            return 'CEREAL';
          }
        } else {
          if (price <= 3550) {
            return 'WATER';
          } else {
            return 'RICE';
          }
        }
      } else {
        if (kcal <= 267.5) {
          if (price <= 5240) {
            return 'FASTFOOD';
          } else {
            return 'WATER';
          }
        } else {
          if (weight <= 495) {
            return 'FASTFOOD';
          } else {
            return 'FASTFOOD';
          }
        }
      }
    }
  }

  modelImage() {
    if (modelReturn() == "CEREAL") {
      imageValue('image/cereal.png');
      return imageValue;
    } else if (modelReturn() == "WATER") {
      imageValue('image/water.png');
      return imageValue;
    } else if (modelReturn() == "RICE") {
      imageValue('image/fried-rice.png');
      return imageValue;
    } else if (modelReturn() == "FASTFOOD") {
      imageValue('image/fastfood.png');
      return imageValue;
    } else if (modelReturn() == "SALAD") {
      imageValue('image/salad.png');
      return imageValue;
    }
  }
}
