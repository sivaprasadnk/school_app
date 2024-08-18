import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_app/core/constant_colors.dart';
import 'package:school_app/presentation/screen/widgets/body_text.dart';
import 'package:school_app/presentation/screen/widgets/common_btn.dart';
import 'package:school_app/presentation/screen/widgets/grey_container.dart';
import 'package:school_app/presentation/screen/widgets/screen_title.dart';

class NewRegnScreen extends StatelessWidget {
  const NewRegnScreen({super.key});

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
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 21.h),
          const ScreenTitle(title: 'New Registration'),
          SizedBox(height: 32.h),
          const GreyContainer(
            child: Row(
              children: [
                BodyText(
                  title: 'Select a student',
                ),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                )
              ],
            ),
          ),
          SizedBox(height: 16.h),
          GreyContainer(
            child: Row(
              children: [
                Text(
                  'Select a subject',
                  style: TextStyle(fontSize: 17.sp),
                ),
                const Spacer(),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                )
              ],
            ),
          ),
          SizedBox(height: 54.h),
          CommonBtn(
            height: 48.h,
            width: 107.w,
            callback: () {},
            bgColor: kDarkGreenColor,
            child: Text(
              "Register",
              style: TextStyle(
                fontSize: 17.sp,
                fontWeight: FontWeight.w600,
                color: kWhiteColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
