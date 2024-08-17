import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_app/core/constant_colors.dart';
import 'package:school_app/data/model/subject_model.dart';
import 'package:school_app/presentation/screen/widgets/screen_title.dart';

class SubjectDetailScreen extends StatelessWidget {
  const SubjectDetailScreen({super.key, required this.subjectModel});
  final SubjectModel subjectModel;

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
          const ScreenTitle(title: 'Subject Detail'),
          SizedBox(height: 137.h),
          CircleAvatar(
            radius: 66.r,
            backgroundColor: kLightBlueColor,
          ),
          SizedBox(height: 61.h),
          Text(
            subjectModel.name,
            style: TextStyle(
              fontSize: 23.sp,
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            subjectModel.teacher,
            style: TextStyle(
              fontSize: 22.sp,
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            "Credit : ${subjectModel.credits}",
            style: TextStyle(
              fontSize: 18.sp,
            ),
          ),
        ],
      ),
    );
  }
}
