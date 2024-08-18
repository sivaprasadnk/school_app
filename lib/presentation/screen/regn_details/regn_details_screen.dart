import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_app/presentation/regn_data.dart';
import 'package:school_app/presentation/screen/widgets/body_text.dart';
import 'package:school_app/presentation/screen/widgets/grey_container.dart';
import 'package:school_app/presentation/screen/widgets/screen_title.dart';

class RegnDetailsScreen extends StatelessWidget {
  const RegnDetailsScreen({
    super.key,
    required this.regnData,
  });
  final RegnData regnData;
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
          const ScreenTitle(title: 'Registration'),
          SizedBox(height: 32.h),
          GreyContainer(
            height: 100,
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const BodyText(title: 'Student Details'),
                    BodyText(
                      title: regnData.student!.name,
                      size: 13,
                    ),
                    BodyText(
                      title: regnData.student!.email,
                      size: 13,
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 8.h),
          GreyContainer(
            height: 100,
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const BodyText(title: 'Subject Details'),
                    BodyText(
                      title: regnData.subject!.name,
                      size: 13,
                    ),
                    BodyText(
                      title: regnData.subject!.teacher,
                      size: 13,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
