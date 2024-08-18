import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_app/core/extensions/string_ext.dart';

class ScreenTitle extends StatelessWidget {
  const ScreenTitle(
      {super.key, required this.title, this.withTitleCase = false});
  final String title;
  final bool withTitleCase;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        withTitleCase ? title.toTitleCase() : title,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 22.sp,
        ),
      ),
    );
  }
}
