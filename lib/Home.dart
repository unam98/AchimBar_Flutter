import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sds_new/Custom/CustomWidget.dart';
import 'package:sds_new/Custom/CustomColor.dart';
import 'package:sds_new/Controller/bottom_nav_controller.dart';
import 'Controller/model_controller.dart';
import 'Result.dart';

class Home extends GetView<BottomNavContoroller> {
  Home({Key? key}) : super(key: key);

  final ModelController modelController = Get.put(ModelController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Obx(
      () => Scaffold(
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
            'Home',
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
              // _widgetOptions.elementAt(_selectedIndex), //인덱스에 해당하는 배열 요소값 출력
              Text(
                "안녕하세요 김우남님!\n어울리는 아침을 찾아드릴게요",
                style: TextStyle(fontSize: 20.sp, fontFamily: "SpoqaHanSansNeo"),
              ),
              SizedBox(height: 30.h),
              WeightSlider("용량", 20, 1400, 1400),
              SizedBox(height: 20.h),
              PriceSlider("가격", 1180, 48000, 1400),
              SizedBox(height: 20.h),
              CookTimeSlider("조리시간", 0, 1200, 1400),
              SizedBox(height: 20.h),
              KcalSlider("칼로리", 0, 2900, 1400),
              SizedBox(height: 20.h),
              Center(child: CustomBigButton("완성", customYellow, Result())),
            ],
          ),
        ),
      ),
    ));
  }
}
