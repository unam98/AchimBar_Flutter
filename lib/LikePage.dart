// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:sds_new/Custom/CustomColor.dart';
// import 'package:sds_new/Controller/bottom_nav_controller.dart';
// import 'package:sds_new/Controller/like_controller.dart';
// import 'package:sds_new/Controller/url_controller.dart';
//
// import 'Controller/model_controller.dart';
//
// class LikePage extends GetView<BottomNavContoroller> {
//   LikePage({Key? key}) : super(key: key);
//
//   final UrlController urlCheck = Get.put(UrlController());
//   final LikeController likeController = Get.find();
//   final ModelController modelController = Get.find();
//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//       () => SafeArea(
//         child: Scaffold(
//             appBar: AppBar(),
//             bottomNavigationBar: BottomNavigationBar(
//               type: BottomNavigationBarType.fixed,
//               showSelectedLabels: false,
//               showUnselectedLabels: false,
//               currentIndex: controller.pageIndex.value,
//               selectedItemColor: Color(0xff7b0cbb),
//               onTap: controller.changeBottomNav,
//               elevation: 0,
//               items: const <BottomNavigationBarItem>[
//                 BottomNavigationBarItem(
//                   icon: Icon(Icons.add),
//                   label: 'Heart',
//                   backgroundColor: Colors.red,
//                 ),
//                 BottomNavigationBarItem(
//                   icon: Icon(Icons.home),
//                   label: 'Home',
//                   backgroundColor: Colors.green,
//                 ),
//                 BottomNavigationBarItem(
//                   icon: Icon(Icons.settings),
//                   label: 'Settings',
//                   backgroundColor: Colors.pink,
//                 ),
//               ],
//             ),
//             body: StreamBuilder(
//               stream: FirebaseFirestore.instance
//                   .collection('data')
//                   .where('category', isEqualTo: "CEREAL")
//                   .where('index', whereIn: likeController.likeList)
//                   .snapshots(),
//               builder: (BuildContext context,
//                   AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 }
//
//                 final docs = snapshot.data!.docs;
//
//                 ///이 아래부터는 싹다 리스트뷰 형태로 일괄 적용되는 것들이야
//                 return Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     if (true)
//                       Text(
//                         "시리얼류",
//                         style: TextStyle(fontSize: 20),
//                       ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [Text("인기순"), Text("가격순")],
//                     ),
//                     Expanded(
//                       child: IndexedStack(index: likeController.stackIndex.value,
//                         children: [Container(child:Text("텅 비었습니다.")),
//                           Padding(
//                               padding: const EdgeInsets.only(
//                                   top: 20, left: 20, right: 20),
//                               child: ListView.separated(
//                                   separatorBuilder:
//                                       (BuildContext context, int index) =>
//                                           const Divider(
//                                             height: 30,
//                                             color: Colors.black,
//                                           ),
//                                   itemCount: docs.length,
//                                   itemBuilder: (context, index) {
//                                     return Row(
//                                       children: [
//                                         ClipRRect(
//                                           borderRadius: BorderRadius.circular(20),
//                                           child: Image.network(
//                                             docs[index]['url_image'],
//                                             errorBuilder:
//                                                 (context, exception, stackTrack) =>
//                                                     Container(
//                                               color: customGray,
//                                               width: 100.w,
//                                               height: 100.h,
//                                               child: Center(child: Text("품절입니다")),
//                                             ),
//                                             width: 100.w,
//                                             height: 100.h,
//                                             fit: BoxFit.cover, //fitWidth 써도 됨
//                                           ),
//                                         ),
//                                         Expanded(
//                                           child: Padding(
//                                             padding:
//                                                 const EdgeInsets.only(left: 10),
//                                             child: Column(
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.start,
//                                               children: [
//                                                 Text(docs[index]['title'],
//                                                     style: TextStyle(
//                                                       fontWeight: FontWeight.bold,
//                                                       fontSize: 14.sp,
//                                                     )),
//                                                 Text(
//                                                   docs[index]['weight'].toString(),
//                                                 ),
//                                                 Text(
//                                                   docs[index]['index'].toString(),
//                                                 ),
//                                                 Row(
//                                                   children: [
//                                                     OutlinedButton(
//                                                       onPressed: () {
//                                                         likeController.likeRemove(
//                                                             docs[index]['index']);
//
//                                                         likeController.printList();
//                                                       },
//                                                       child: Text("삭제",
//                                                           style: TextStyle(
//                                                               color: customBlack)),
//                                                       style: OutlinedButton.styleFrom(
//                                                           minimumSize:
//                                                               Size(100, 34.7),
//                                                           side: BorderSide(
//                                                               color: customPurple,
//                                                               width: 2),
//                                                           shape: RoundedRectangleBorder(
//                                                               borderRadius:
//                                                                   BorderRadius.all(
//                                                                       Radius
//                                                                           .circular(
//                                                                               15)))),
//                                                     ),
//                                                     Padding(
//                                                       padding:
//                                                           const EdgeInsets.only(
//                                                               left: 6),
//                                                       child: ElevatedButton(
//                                                         onPressed: () {
//                                                           urlCheck.launchURL(
//                                                               docs[index]['url']);
//                                                         },
//                                                         child: Text(
//                                                           "자세히 보기",
//                                                           style: TextStyle(
//                                                               color: Colors.black),
//                                                         ),
//                                                         style: ElevatedButton.styleFrom(
//                                                             elevation: 0,
//                                                             primary: customPurple,
//                                                             shape: RoundedRectangleBorder(
//                                                                 borderRadius:
//                                                                     BorderRadius
//                                                                         .all(Radius
//                                                                             .circular(
//                                                                                 15))),
//                                                             minimumSize:
//                                                                 Size(100, 34.7)),
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 )
//                                               ],
//                                             ),
//                                           ),
//                                         )
//                                       ],
//                                     );
//                                   }))],
//                       ),
//                     ),
//                   ],
//                 );
//               },
//             )),
//       ),
//     );
//   }
// }
