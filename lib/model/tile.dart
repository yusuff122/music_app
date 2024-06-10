import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Tile extends StatelessWidget {
  const Tile({
    Key? key,
    required this.index,
    this.extent,
    this.backgroundColor,
    this.bottomSpace,
  }) : super(key: key);

  final int index;
  final double? extent;
  final double? bottomSpace;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final child = Container(
      
      decoration: BoxDecoration( color: Colors.black),
      //height: extent,
      width: extent,
      child: Center(
        child: Container(
          height: 15.h,
          //width: 33.w,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50.sp),
            
          ),
        ),
      ),
    );

    if (bottomSpace == null) {
      return child;
    }

    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        Expanded(child: child),
        Container(
          height: bottomSpace,
          color: Colors.green,
        )
      ],
    );
  }
}
