import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_app/core/constant_colors.dart';
import 'package:school_app/presentation/screen/widgets/grid_tile_item.dart';

class HomeScreenGrid extends StatelessWidget {
  const HomeScreenGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const GridTileItem(
              bgColor: kLightGreenColor,
              title: 'Students',
              icon: 'student',
            ),
            SizedBox(width: 7.w),
            const GridTileItem(
              bgColor: kLightBlueColor,
              title: 'Subjects',
              icon: 'subject',
            ),
          ],
        ),
        SizedBox(height: 28.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const GridTileItem(
              bgColor: kLightRedColor,
              title: 'Class Rooms',
              icon: 'class',
            ),
            SizedBox(width: 7.w),
            const GridTileItem(
              bgColor: kLightYellowColor,
              title: 'Registration',
              icon: 'regn',
              imgHeight: 35,
            ),
          ],
        ),
      ],
    );
  }
}
