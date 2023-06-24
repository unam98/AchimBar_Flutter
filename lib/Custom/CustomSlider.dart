import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sds_new/Custom/CustomColor.dart';

//CustomWidget 파일에 따로 만들었음. 이건 안 쓰는 거.
class CustomSlider extends StatefulWidget {
  final String label;
  final int sliderMin;
  final int sliderMax;

  CustomSlider(this.label, this.sliderMin, this.sliderMax);

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  double _currentSliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Stack(alignment: AlignmentDirectional.center, children: <Widget>[
        Container(
          width: 100.w,
          height: 30.h,
          // color: Color(0xffdd95ef),
          decoration: BoxDecoration(
              color: customPurple, borderRadius: BorderRadius.circular(15)),
        ),
        Positioned(child: Text(widget.label))
      ]),
      Padding(
        padding: const EdgeInsets.only(left: 40, right: 40),
        child: Column(
          children: [
            Slider(
              value: _currentSliderValue,
              activeColor: Colors.black,
              inactiveColor: Color(0x616200ee),
              max: 100,
              divisions: 100,
              label: _currentSliderValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue = value;
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(child: Text(widget.sliderMin.toString())),
                Container(child: Text(widget.sliderMax.toString()))
              ],
            ),
          ],
        ),
      )
    ]);
  }
}
