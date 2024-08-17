import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_app/core/constant_colors.dart';
import 'package:school_app/presentation/screen/new_regn/new_regn_screen.dart';
import 'package:school_app/presentation/screen/widgets/screen_title.dart';

class RegnScreen extends StatelessWidget {
  const RegnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios_rounded),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 21.h),
          const ScreenTitle(title: 'Registration'),
          SizedBox(height: 254.h),
          Text(
            'No data',
            style: TextStyle(
              fontSize: 17.sp,
            ),
          ),
          SizedBox(height: 284.h),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const NewRegnScreen()));
            },
            child: Container(
              height: 48.h,
              width: 177.w,
              decoration: BoxDecoration(
                color: kLightBlueColor,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Center(
                child: Text(
                  'New Registration',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 17.sp,
                    color: kDarkBlueColor,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
