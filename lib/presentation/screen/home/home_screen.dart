import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_app/core/constant_colors.dart';
import 'package:school_app/presentation/screen/widgets/grid_tile_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      // appBar: PreferredSize(
      //   preferredSize: const Size.fromHeight(70),
      //   child: AppBar(
      //     centerTitle: false,
      //     title: Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       mainAxisSize: MainAxisSize.min,
      //       children: [
      //         Text(
      //           'Hello,',
      //           style: TextStyle(
      //             fontWeight: FontWeight.w700,
      //             // height: 33.41.h,
      //             fontSize: 28.sp,
      //           ),
      //         ),
      //         Text(
      //           'Good Morning',
      //           style: TextStyle(
      //             fontWeight: FontWeight.w400,
      //             fontSize: 22.sp,
      //           ),
      //         )
      //       ],
      //     ),
      //     actions: [
      //       GestureDetector(
      //         onTap: () {},
      //         child: const Icon(Icons.menu),
      //       ),
      //       SizedBox(width: 19.w),
      //     ],
      //   ),
      // ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 72.h),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Hello,',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        // height: 33.41.h,
                        fontSize: 28.sp,
                      ),
                    ),
                    Text(
                      'Good Morning',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 22.sp,
                      ),
                    )
                  ],
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {},
                  child: const Icon(Icons.menu),
                ),
                // SizedBox(width: 19.w),
              ],
            ),
            SizedBox(height: 57.h),
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
        ),
      ),
    );
  }
}
