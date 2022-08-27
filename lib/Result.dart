import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sds_new/Custom/CustomWidget.dart';
import 'package:sds_new/Custom/CustomColor.dart';
import 'package:sds_new/Sort.dart';
import 'package:sds_new/Controller/bottom_nav_controller.dart';
import 'Controller/model_controller.dart';


class Result extends GetView<BottomNavContoroller> {
  Result({Key? key}) : super(key: key);

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
                'Result',
                style: TextStyle(
                    fontFamily: "NotoSans",
                    fontSize: 17,
                    color: Colors.black),
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
                  Text(
                    "김우남님께 어울리는 아침은\n${modelController.modelReturn()}입니다.",
                    style: TextStyle(
                        fontSize: 20.sp, fontFamily: "SpoqaHanSansNeo"),
                  ),
                  //혹시 몰라서 백업 코드는 숨겨놓음
                  // Center(
                  //   child: ClipRRect(
                  //     borderRadius: BorderRadius.circular(20),
                  //     child: Image.asset("${modelController.modelImage()}"
                  //           ,width: 150.w,
                  //     height: 150.h,
                  //     fit: BoxFit.cover,),
                  //
                  //     ),
                  // ),
                  // Center(
                  //   child: Stack(
                  //       alignment: AlignmentDirectional.center,
                  //       children: <Widget>[
                  //         Container(
                  //           width: 180.w,
                  //           height: 180.h,
                  //           // color: Color(0xffdd95ef),
                  //           decoration: BoxDecoration(
                  //               color: Color(0xffe4e4e4),
                  //               borderRadius: BorderRadius.all(Radius.circular(100))),
                  //         ),
                  //         Positioned(
                  //             child: Image.asset(
                  //               '${modelController.modelImage()}',
                  //               width: 120.w,
                  //               height: 120.h,
                  //             ))
                  //       ]),
                  // ), 숨겨놓음
                  Padding(
                    padding: const EdgeInsets.only(top: 26),
                    child: Center(
                      child:
                                Image.asset(
                                  '${modelController.modelImage()}',
                                  width: 140.w,
                                  height: 140.h,
                                )),
                  ),


                  // Center(
                  //   child: CircleAvatar(
                  //       foregroundImage:
                  //           AssetImage("${modelController.modelImage()}"),
                  //       backgroundColor: Color(0xffe4e4e4),
                  //       radius: 100),
                  // ), //곡률은 유지되고 크기만 바뀜

                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 12),
                    child: Divider(color: customGray, thickness: 1),
                  ),
                  Text(
                    "아침을 챙겨먹으면 좋은 이유",
                    style: TextStyle(
                      fontSize: 20.sp,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Stack(
                                alignment: AlignmentDirectional.center,
                                children: <Widget>[
                                  Container(
                                    width: 70.w,
                                    height: 70.h,
                                    // color: Color(0xffdd95ef),
                                    decoration: BoxDecoration(
                                        color: Color(0xffe4e4e4),
                                        borderRadius: BorderRadius.circular(15)),
                                  ),
                                  Positioned(
                                      child: Image.asset(
                                    'image/muscle.png',
                                    width: 50.w,
                                  ))
                                ]),
                            Text("건강", style: TextStyle(
                              fontSize: 16
                            ),)
                          ],
                        ),
                        Column(
                          children: [
                            Stack(
                                alignment: AlignmentDirectional.center,
                                children: <Widget>[
                                  Container(
                                    width: 70.w,
                                    height: 70.h,
                                    // color: Color(0xffdd95ef),
                                    decoration: BoxDecoration(
                                        color: Color(0xffe4e4e4),
                                        borderRadius: BorderRadius.circular(15)),
                                  ),
                                  Positioned(
                                      child: Image.asset(
                                    'image/smiling-face.png',
                                    width: 50.w,
                                  ))
                                ]),
                            Text("피로감소", style: TextStyle(
                                fontSize: 16
                            ))
                          ],
                        ),
                        Column(
                          children: [
                            Stack(
                                alignment: AlignmentDirectional.center,
                                children: <Widget>[
                                  Container(
                                    width: 70.w,
                                    height: 70.h,
                                    // color: Color(0xffdd95ef),
                                    decoration: BoxDecoration(
                                        color: Color(0xffe4e4e4),
                                        borderRadius: BorderRadius.circular(15)),
                                  ),
                                  Positioned(
                                      child: Image.asset(
                                    'image/heart.png',
                                    width: 50.w,
                                  ))
                                ]),
                            Text("비만예방", style: TextStyle(
                                fontSize: 16
                            ))
                          ],
                        ),
                      ]),
                  SizedBox(height: 134.h),
                  Center(
                    child: Column(
                      children: [
                        CustomBigButton("먹으러 가기", customYellow, Sort()),
                        // SizedBox(height: 10.h),
                        // ElevatedButton(onPressed: (){
                        //   Get.to(TableLayout());
                        // }, child: Text("test"))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
