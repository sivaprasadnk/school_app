import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListItem extends StatelessWidget {
  const ListItem({super.key, required this.title, required this.bgcolor});
  final String title;
  final Color bgcolor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: double.infinity,
        height: 48.h,
        decoration: BoxDecoration(
          color: bgcolor,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 17.sp,
            ),
          ),
        ),
      ),
    );
  }
}
