import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_app/presentation/screen/class_list/class_list_screen.dart';
import 'package:school_app/presentation/screen/regn/regn_screen.dart';
import 'package:school_app/presentation/screen/student_list/students_list_screen.dart';
import 'package:school_app/presentation/screen/subject_list/subject_list_screen.dart';

class GridTileItem extends StatelessWidget {
  const GridTileItem(
      {super.key,
      required this.bgColor,
      required this.title,
      required this.icon,
      this.imgHeight = 48});
  final Color bgColor;
  final String title;
  final String icon;
  final double imgHeight;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (title.toLowerCase() == 'students') {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => const StudentsListScreen()));
          } else if (title.toLowerCase() == "subjects") {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => const SubjectListScreen()));
          } else if (title.toLowerCase() == "class rooms") {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => const ClassListScreen()));
          } else {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => const RegnScreen()));
          }
        },
        child: Container(
          height: 216.h,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/$icon.png',
                  height: imgHeight.h,
                ),
                SizedBox(height: 8.h),
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 17.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
