import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sds_new/Controller/bottom_nav_controller.dart';
import 'package:sds_new/Sort.dart';
import 'Controller/model_controller.dart';

class Category extends GetView<BottomNavContoroller> {
  Category({Key? key}) : super(key: key);

  final ModelController modelController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            automaticallyImplyLeading: false,
            leading: BackButton(
                color: Colors.black,
                onPressed: () {
                  Get.back();
                }),
            title: Text(
              'Category',
              style: TextStyle(
                  fontFamily: "NotoSans", fontSize: 17, color: Colors.black),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                  color: Colors.black,
                  onPressed: () {},
                  icon: const Icon(Icons.share),
                  iconSize: 24),
              IconButton(
                  color: Colors.black,
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                  iconSize: 24),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: controller.pageIndex.value,
            selectedItemColor: Color(0xff7b0cbb),
            onTap: controller.changeBottomNav,
            elevation: 0,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.category),
                label: 'Category',
                backgroundColor: Colors.red,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: Colors.green,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
                backgroundColor: Colors.pink,
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: CircleAvatar(
                    child: ClipRRect(
                      child: Image.asset('image/cereal.png'),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                backgroundColor: Colors.white),
                  title: Text("cereal"),
                  trailing: Icon(Icons.keyboard_arrow_right_outlined),
                  onTap: () {
                    modelController.weight.value = 20.0;
                    modelController.price.value = 1180.0;
                    modelController.cook_time.value = 0.0;
                    modelController.kcal.value = 0.0;
                    Get.to(Sort());
                  },
                ),
                ListTile(
                  leading: CircleAvatar(
                    // radius: 16.0,
                    child: ClipRRect(
                      child: Image.asset('image/fastfood.png'),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                      backgroundColor: Colors.white),
                  title: Text("fastfood"),
                  trailing: Icon(Icons.keyboard_arrow_right_outlined),
                  onTap: () {
                    modelController.weight.value = 500.0;
                    modelController.price.value = 1180.0;
                    modelController.cook_time.value = 0.0;
                    modelController.kcal.value = 0.0;
                    Get.to(Sort());
                  },
                ),
                ListTile(
                  leading: CircleAvatar(
                    // radius: 16.0,
                    child: ClipRRect(
                      child: Image.asset('image/fried-rice.png'),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                      backgroundColor: Colors.white),
                  title: Text("rice"),
                  trailing: Icon(Icons.keyboard_arrow_right_outlined),
                  onTap: () {
                    modelController.weight.value = 220.0;
                    modelController.price.value = 4600.0;
                    modelController.cook_time.value = 200.0;
                    modelController.kcal.value = 0.0;
                    Get.to(Sort());
                  },
                ),
                ListTile(
                  leading: CircleAvatar(
                    // radius: 16.0,
                    child: ClipRRect(
                      child: Image.asset('image/salad.png'),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                      backgroundColor: Colors.white),
                  title: Text("salad"),
                  trailing: Icon(Icons.keyboard_arrow_right_outlined),
                  onTap: () {
                    modelController.weight.value = 220.0;
                    modelController.price.value = 4600.0;
                    modelController.cook_time.value = 0.0;
                    modelController.kcal.value = 0.0;
                    Get.to(Sort());
                  },
                ),
                ListTile(
                  leading: CircleAvatar(
                    // radius: 16.0,
                    child: ClipRRect(
                      child: Image.asset('image/water.png'),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                      backgroundColor: Colors.white),
                  title: Text("water"),
                  trailing: Icon(Icons.keyboard_arrow_right_outlined),
                  onTap: () {
                    modelController.weight.value = 220.0;
                    modelController.price.value = 5500.0;
                    modelController.cook_time.value = 80.0;
                    modelController.kcal.value = 0.0;
                    Get.to(Sort());
                  },
                )

              ],
            ),
          )
          )),
    );
  }
}
