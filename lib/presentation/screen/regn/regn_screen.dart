import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_app/core/constant_colors.dart';
import 'package:school_app/presentation/screen/new_regn/new_regn_screen.dart';
import 'package:school_app/presentation/screen/widgets/body_text.dart';
import 'package:school_app/presentation/screen/widgets/common_btn.dart';
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
          const BodyText(
            title: 'No data',
          ),
          SizedBox(height: 284.h),
          CommonBtn(
            height: 48.h,
            width: 177.w,
            callback: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const NewRegnScreen()));
            },
            bgColor: kLightBlueColor,
            child: Text(
              'New Registration',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 17.sp,
                color: kDarkBlueColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
