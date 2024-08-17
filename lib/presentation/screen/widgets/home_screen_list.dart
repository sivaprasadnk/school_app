import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_app/core/constant_colors.dart';
import 'package:school_app/presentation/screen/class_list/class_list_screen.dart';
import 'package:school_app/presentation/screen/regn/regn_screen.dart';
import 'package:school_app/presentation/screen/student_list/students_list_screen.dart';
import 'package:school_app/presentation/screen/subject_list/subject_list_screen.dart';
import 'package:school_app/presentation/screen/widgets/list_item.dart';

class HomeScreenList extends StatelessWidget {
  const HomeScreenList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => const StudentsListScreen()));
          },
          child: const ListItem(
            title: 'Students',
            bgcolor: kLightGreenColor,
          ),
        ),
        SizedBox(height: 40.h),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => const SubjectListScreen()));
          },
          child: const ListItem(
            title: 'Subjects',
            bgcolor: kLightBlueColor,
          ),
        ),
        SizedBox(height: 40.h),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => const ClassListScreen()));
          },
          child: const ListItem(
            title: 'Class Rooms',
            bgcolor: kLightRedColor,
          ),
        ),
        SizedBox(height: 40.h),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => const RegnScreen()));
          },
          child: const ListItem(
            title: 'Registration',
            bgcolor: kLightYellowColor,
          ),
        ),
        SizedBox(height: 40.h),
      ],
    );
  }
}
