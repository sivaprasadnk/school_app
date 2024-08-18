import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_app/core/constant_colors.dart';

class GreyContainer extends StatelessWidget {
  const GreyContainer({
    super.key,
    required this.child,
    this.height = 70,
  });
  final Widget child;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.h + 2.h,
      margin: EdgeInsets.only(bottom: 16.h, left: 16.w, right: 16.w),
      padding: EdgeInsets.only(
        left: 22.w,
        top: 13.h,
        bottom: 14.h,
        right: 22.w,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: kLightGreyColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: child,
    );
  }
}
