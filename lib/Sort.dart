import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sds_new/Controller/bottom_nav_controller.dart';
import 'package:sds_new/Controller/url_controller.dart';
import 'package:sds_new/Custom/CustomColor.dart';

import 'Controller/model_controller.dart';
import 'Controller/recommend_controller.dart';

class Sort extends GetView<BottomNavContoroller> {
  Sort({Key? key}) : super(key: key);

  final UrlController urlCheck = Get.put(UrlController());
  final RecommendController recommendController =
      Get.put(RecommendController());
  final ModelController modelController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => SafeArea(
          child: Scaffold(
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
                'Sort',
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
            body: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('data')
                  .where('category',
                      isEqualTo: "${modelController.modelReturn()}")
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                final docs = snapshot.data!.docs;

                ///이 아래부터는 싹다 리스트뷰 형태로 일괄 적용되는 것들이야
                return Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${modelController.modelReturn()}",
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontFamily: "SpoqaHanSansNeo",
                            fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Scrollbar(
                            child: ListView.separated(
                                physics: BouncingScrollPhysics(),
                                separatorBuilder:
                                    (BuildContext context, int index) =>
                                        const Divider(
                                          height: 30,
                                          color: Colors.black,
                                        ),
                                itemCount: docs.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    width: 100,
                                    height: 100,
                                    child: Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Image.network(
                                            docs[index]['url_image'],
                                            errorBuilder: (context, exception,
                                                    stackTrack) =>
                                                Container(
                                              color: customGray,
                                              width: 100,
                                              height: 100,
                                              child:
                                                  Center(child: Text("품절입니다")),
                                            ),
                                            width: 100,
                                            height: 100,
                                            fit: BoxFit.cover, //fitWidth 써도 됨
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Column(
                                              children: [
                                                Text(docs[index]['title'],
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 14.sp,
                                                        overflow: TextOverflow
                                                            .ellipsis)),
                                                SizedBox(height: 4),
                                                Text(
                                                  "용량 : ${docs[index]['weight'].floor().toString()}g, 칼로리 : ${docs[index]['kcal'].floor().toString()}kcal",
                                                ),
                                                SizedBox(height: 6),

                                                ///BottomSheet
                                                Container(
                                                  child: Row(
                                                    children: [
                                                      OutlinedButton(
                                                        onPressed: () {
                                                          recommendController
                                                              .firebaseList(
                                                                  index);
                                                          showModalBottomSheet(
                                                              constraints:
                                                                  BoxConstraints(
                                                                      maxHeight: 370
                                                                          .h),
                                                              enableDrag: false,
                                                              context: context,
                                                              //여기 context 뭘로 해야 되는지 모르겠어. 어떻게 쓰이는 건지,,,
                                                              builder:
                                                                  (context) {
                                                                return StreamBuilder(
                                                                    stream: FirebaseFirestore
                                                                        .instance
                                                                        .collection(
                                                                            'data')
                                                                        .where(
                                                                            'index',
                                                                            whereIn: recommendController
                                                                                .defaultList)
                                                                        .snapshots(),
                                                                    builder: (BuildContext
                                                                            context2,
                                                                        AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                                                                            snapshot) {
                                                                      if (snapshot
                                                                              .connectionState ==
                                                                          ConnectionState
                                                                              .waiting) {
                                                                        return Center(
                                                                          child:
                                                                              CircularProgressIndicator(),
                                                                        );
                                                                      }
                                                                      final docs = snapshot
                                                                          .data!
                                                                          .docs;
                                                                      // listView하고 별개인 Column 이게 있어야 닫기 버튼 가능
                                                                      return Padding(
                                                                        padding: const EdgeInsets.only(
                                                                            left:
                                                                                20,
                                                                            right:
                                                                                20,
                                                                            bottom:
                                                                                20),
                                                                        child:
                                                                            Column(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Padding(
                                                                              padding: const EdgeInsets.only(bottom: 16, top: 12),
                                                                              child: Text("유사 제품 추천 목록", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis)),
                                                                            ),
                                                                            Expanded(
                                                                              child: ListView.builder(
                                                                                  physics: BouncingScrollPhysics(),
                                                                                  scrollDirection: Axis.horizontal,
                                                                                  itemCount: docs.length,
                                                                                  itemBuilder: (context2, index2) {
                                                                                    //이거는 내가 요소들 세로 배치해보려고 넣은 Column
                                                                                    return Container(
                                                                                      width: 130.w,
                                                                                      child: Column(
                                                                                        children: [
                                                                                          ClipRRect(
                                                                                            borderRadius: BorderRadius.circular(20),
                                                                                            child: Image.network(
                                                                                              docs[index2]['url_image'],
                                                                                              errorBuilder: (context, exception, stackTrack) => Container(
                                                                                                color: customGray,
                                                                                                width: 110,
                                                                                                height: 110,
                                                                                                child: Center(child: Text("품절입니다")),
                                                                                              ),
                                                                                              width: 110,
                                                                                              height: 110,
                                                                                              fit: BoxFit.cover, //fitWidth 써도 됨
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: const EdgeInsets.only(top: 6),
                                                                                            child: Container(
                                                                                              width: 110.w,
                                                                                              child: Column(children: [
                                                                                                Text(
                                                                                                  docs[index2]['title'],
                                                                                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp, overflow: TextOverflow.ellipsis),
                                                                                                  overflow: TextOverflow.ellipsis,
                                                                                                ),
                                                                                                Text(
                                                                                                  "용량 : ${docs[index2]['weight'].floor().toString()}g",
                                                                                                  overflow: TextOverflow.ellipsis,
                                                                                                ),
                                                                                                Text(
                                                                                                  "칼로리 : ${docs[index2]['kcal'].floor().toString()}kcal",
                                                                                                  overflow: TextOverflow.ellipsis,
                                                                                                ),
                                                                                              ], crossAxisAlignment: CrossAxisAlignment.start),
                                                                                            ),
                                                                                          ),
                                                                                          ElevatedButton(
                                                                                            onPressed: () {
                                                                                              urlCheck.launchURL(docs[index2]['url']);
                                                                                            },
                                                                                            child: Text(
                                                                                              "자세히 보기",
                                                                                              style: TextStyle(color: Colors.black),
                                                                                            ),
                                                                                            style: ElevatedButton.styleFrom(elevation: 0, primary: customPurple, shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))), fixedSize: Size(110.w, 34.7.h)),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    );
                                                                                  }),
                                                                            ),
                                                                            Center(
                                                                              child: ElevatedButton(
                                                                                  onPressed: () {
                                                                                    recommendController.removeList();
                                                                                    Get.back();
                                                                                  },
                                                                                  child: Text(
                                                                                    "닫기",
                                                                                    style: TextStyle(color: customBlack, fontSize: 18.sp),
                                                                                  ),
                                                                                  style: ElevatedButton.styleFrom(primary: customYellow, elevation: 0, shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))), minimumSize: Size(300.w, 50.h))),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      );
                                                                    });
                                                              },
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.only(
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              20),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              20))));
                                                        },
                                                        child: Text("유사 추천",
                                                            style: TextStyle(
                                                                color:
                                                                    customBlack)),
                                                        style: OutlinedButton.styleFrom(
                                                            minimumSize:
                                                                Size(100, 34.7),
                                                            side: BorderSide(
                                                                color:
                                                                    customPurple,
                                                                width: 2),
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            15)))),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 6),
                                                        child: Flexible(
                                                          child: ElevatedButton(
                                                            onPressed: () {
                                                              urlCheck.launchURL(
                                                                  docs[index]
                                                                      ['url']);
                                                            },
                                                            child: Text(
                                                              "자세히 보기",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                            style: ElevatedButton.styleFrom(
                                                                elevation: 0,
                                                                primary:
                                                                    customPurple,
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.all(Radius.circular(
                                                                            15))),
                                                                minimumSize:
                                                                    Size(100,
                                                                        34.7)),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                }),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ));
  }
}
