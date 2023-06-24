import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sds_new/Custom/CustomColor.dart';

import '../Controller/model_controller.dart';

final ModelController modelController = Get.find();

class CustomBigButton extends StatelessWidget {
  final String label;
  final route;
  final color;

  CustomBigButton(this.label, this.color, this.route);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Get.to(route, transition: Transition.noTransition);
      },
      child: Text(
        label,
        style: TextStyle(color: customBlack, fontSize: 18.sp),
      ),
      style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: color,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
          minimumSize: Size(300.w, 50.h)),
    );
  }
}

class CustomOffButton extends StatelessWidget {
  final String label;
  final route;
  final color;

  CustomOffButton(this.label, this.color, this.route);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Get.offAll(route);
      },
      child: Text(
        label,
        style: TextStyle(color: customBlack, fontSize: 20.sp),
      ),
      style: ElevatedButton.styleFrom(
          primary: color,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
          minimumSize: Size(300.w, 50.h)),
    );
  }
}

class WeightSlider extends StatelessWidget {
  final String title;
  final double maxValue;
  final double minValue;
  final int division;

  WeightSlider(this.title, this.minValue, this.maxValue, this.division);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          children: [
            Stack(alignment: AlignmentDirectional.center, children: <Widget>[
              Center(
                child: Container(
                  width: 100.w,
                  height: 30.h,
                  // color: Color(0xffdd95ef),
                  decoration: BoxDecoration(
                      color: customPurple,
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
              Positioned(child: Text(title))
            ]),
            Slider(
                value: modelController.weight.value,
                onChanged: (double value) {
                  modelController.weight.value = value;
                },
                activeColor: Color(0xff6200ee),
                inactiveColor: Color(0x616200ee),
                max: maxValue,
                min: minValue,
                divisions: division,
                label: "${modelController.weight.value.round()}g"),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${minValue.toInt()}g"),
                  Text("${maxValue.toInt()}g"),
                ],
              ),
            ),
          ],
        ));
  }
}

class PriceSlider extends StatelessWidget {
  final String title;
  final double maxValue;
  final double minValue;
  final int division;

  PriceSlider(this.title, this.minValue, this.maxValue, this.division);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          children: [
            Stack(alignment: AlignmentDirectional.center, children: <Widget>[
              Center(
                child: Container(
                  width: 100.w,
                  height: 30.h,
                  // color: Color(0xffdd95ef),
                  decoration: BoxDecoration(
                      color: customPurple,
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
              Positioned(child: Text(title))
            ]),
            Slider(
                value: modelController.price.value,
                onChanged: (double value) {
                  modelController.price.value = value;
                },
                activeColor: Color(0xff6200ee),
                inactiveColor: Color(0x616200ee),
                max: maxValue,
                min: minValue,
                divisions: division,
                label: "${modelController.price.value.round()}원"),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${minValue.toInt()}원"),
                  Text("${maxValue.toInt()}원"),
                ],
              ),
            ),
          ],
        ));
  }
}

class CookTimeSlider extends StatelessWidget {
  final String title;
  final double maxValue;
  final double minValue;
  final int division;

  CookTimeSlider(this.title, this.minValue, this.maxValue, this.division);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          children: [
            Stack(alignment: AlignmentDirectional.center, children: <Widget>[
              Center(
                child: Container(
                  width: 100.w,
                  height: 30.h,
                  // color: Color(0xffdd95ef),
                  decoration: BoxDecoration(
                      color: customPurple,
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
              Positioned(child: Text(title))
            ]),
            Slider(
                value: modelController.cook_time.value,
                onChanged: (double value) {
                  modelController.cook_time.value = value;
                },
                activeColor: Color(0xff6200ee),
                inactiveColor: Color(0x616200ee),
                max: maxValue,
                min: minValue,
                divisions: division,
                label: "${modelController.cook_time.value.round()}초"),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${minValue.toInt()}초"),
                  Text("${maxValue.toInt()}초"),
                ],
              ),
            ),
          ],
        ));
  }
}

class KcalSlider extends StatelessWidget {
  final String title;
  final double maxValue;
  final double minValue;
  final int division;

  KcalSlider(this.title, this.minValue, this.maxValue, this.division);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          children: [
            Stack(alignment: AlignmentDirectional.center, children: <Widget>[
              Center(
                child: Container(
                  width: 100.w,
                  height: 30.h,
                  // color: Color(0xffdd95ef),
                  decoration: BoxDecoration(
                      color: customPurple,
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
              Positioned(child: Text(title))
            ]),
            Slider(
                value: modelController.kcal.value,
                onChanged: (double value) {
                  modelController.kcal.value = value;
                },
                activeColor: Color(0xff6200ee),
                inactiveColor: Color(0x616200ee),
                max: maxValue,
                min: minValue,
                divisions: division,
                label: "${modelController.kcal.value.round()}kcal"),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${minValue.toInt()}kcal"),
                  Text("${maxValue.toInt()}kcal"),
                ],
              ),
            ),
          ],
        ));
  }
}
