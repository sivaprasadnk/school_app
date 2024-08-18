import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_app/core/constant_colors.dart';
import 'package:school_app/presentation/providers.dart';
import 'package:school_app/presentation/regn_data.dart';
import 'package:school_app/presentation/screen/widgets/body_text.dart';
import 'package:school_app/presentation/screen/widgets/common_btn.dart';
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
                ),
                const Spacer(),
                BodyText(
                  title: 'Age : ${regnData.student!.age}',
                  size: 13,
                ),
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
                ),
                const Spacer(),
                BodyText(
                  title: 'Credit : ${regnData.subject!.credits}',
                  size: 13,
                ),
              ],
            ),
          ),
          SizedBox(height: 312.h),
          Consumer(builder: (context, ref, _) {
            return CommonBtn(
              height: 48.h,
              width: 193.w,
              callback: () {
                if (Platform.isIOS) {
                  showDialog(
                      context: context,
                      builder: (_) {
                        return CupertinoAlertDialog(
                          title: const Text("Delete"),
                          content: const Text("Do want to delete?"),
                          actions: [
                            CupertinoDialogAction(
                              child: const Text("No"),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            CupertinoDialogAction(
                              child: const Text("Yes"),
                              onPressed: () async {
                                await ref
                                    .read(homeScreenNotifierProvider.notifier)
                                    .deleteRegn(regnData.id!);
                                if (context.mounted) {
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                }
                              },
                            )
                          ],
                        );
                      });
                } else {
                  showDialog(
                      context: context,
                      builder: (_) {
                        return AlertDialog(
                          title: const Text("Delete"),
                          content: const Text("Do want to delete?"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("No"),
                            ),
                            TextButton(
                              onPressed: () async {
                                await ref
                                    .read(homeScreenNotifierProvider.notifier)
                                    .deleteRegn(regnData.id!);
                                if (context.mounted) {
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                }
                              },
                              child: const Text("Yes"),
                            ),
                          ],
                        );
                      });
                }
              },
              bgColor: kDarkRedColor,
              child: Text(
                "Delete Registration",
                style: TextStyle(
                  color: kWhiteColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 17.sp,
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
