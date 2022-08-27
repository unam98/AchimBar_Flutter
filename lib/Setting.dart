import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sds_new/Custom/CustomWidget.dart';
import 'package:sds_new/Custom/CustomColor.dart';
import 'package:sds_new/Sort.dart';
import 'package:sds_new/Controller/bottom_nav_controller.dart';
import 'Controller/model_controller.dart';

class Setting extends GetView<BottomNavContoroller> {
  Setting({Key? key}) : super(key: key);

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
                'Setting',
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
            body: Center(
              child: Column(
                children: [
                  SizedBox(height: 50),
                  CircleAvatar(
                      foregroundImage: AssetImage("image/student.png"),
                      backgroundColor: Color(0xffe4e4e4),
                      radius: 100),
                  SizedBox(height: 20),
                  Text(
                    'dnska6657@naver.com',
                    style: TextStyle(
                        fontFamily: "NotoSans", fontSize: 17, color: customBlack),
                  ),
                ],
              ),
            ),
            //곡률은 유지되고 크기만 바뀜
          )),
    );
  }
}
