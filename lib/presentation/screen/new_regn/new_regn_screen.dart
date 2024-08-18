import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_app/core/constant_colors.dart';
import 'package:school_app/presentation/providers.dart';
import 'package:school_app/presentation/screen/student_list/students_list_screen.dart';
import 'package:school_app/presentation/screen/subject_list/subject_list_screen.dart';
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
      body: Consumer(builder: (context, ref, _) {
        ref.watch(regnNotifierProvider);
        var student = ref.read(regnNotifierProvider.notifier).regnStudent();
        var subject = ref.read(regnNotifierProvider.notifier).regnSubject();
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 21.h),
            const ScreenTitle(title: 'New Registration'),
            SizedBox(height: 32.h),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const StudentsListScreen(
                              viewMode: false,
                              registerMode: true,
                            )));
              },
              child: GreyContainer(
                child: Row(
                  children: [
                    student == null
                        ? const BodyText(
                            title: 'Select a student',
                          )
                        : BodyText(
                            title: student.name,
                          ),
                    const Spacer(),
                    // if (student == null)
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 8.h),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const SubjectListScreen(
                              viewMode: false,
                              registerMode: true,
                            )));
              },
              child: GreyContainer(
                child: Row(
                  children: [
                    subject == null
                        ? const BodyText(
                            title: 'Select a subject',
                          )
                        : BodyText(
                            title: subject.name,
                          ),
                    const Spacer(),
                    // if (subject == null)
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 54.h),
            CommonBtn(
              height: 48.h,
              width: 107.w,
              callback: () {
                var data = ref.read(regnNotifierProvider.notifier).submitData();
                ref
                    .read(homeScreenNotifierProvider.notifier)
                    .submitRegn(data.student!.id, data.subject!.id);
                Navigator.pop(context);
              },
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
        );
      }),
    );
  }
}
