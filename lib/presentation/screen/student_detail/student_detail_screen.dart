import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_app/core/constant_colors.dart';
import 'package:school_app/data/model/student_model.dart';
import 'package:school_app/presentation/screen/widgets/screen_title.dart';

class StudentDetailScreen extends StatelessWidget {
  const StudentDetailScreen({super.key, required this.studentModel});
  final StudentModel studentModel;

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
          const ScreenTitle(title: 'Student Detail'),
          SizedBox(height: 137.h),
          CircleAvatar(
            radius: 66.r,
            backgroundColor: kLightBlueColor,
          ),
          SizedBox(height: 61.h),
          Text(
            studentModel.name,
            style: TextStyle(
              fontSize: 23.sp,
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            'Age : ${studentModel.age}',
            style: TextStyle(
              fontSize: 22.sp,
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            studentModel.email,
            style: TextStyle(
              fontSize: 18.sp,
            ),
          ),
        ],
      ),
    );
  }
}
