import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_app/core/constant_colors.dart';
import 'package:school_app/domain/entity/classroom.dart';
import 'package:school_app/presentation/providers.dart';
import 'package:school_app/presentation/screen/student_list/students_list_screen.dart';
import 'package:school_app/presentation/screen/subject_list/subject_list_screen.dart';
import 'package:school_app/presentation/screen/widgets/body_text.dart';
import 'package:school_app/presentation/screen/widgets/common_btn.dart';
import 'package:school_app/presentation/screen/widgets/grey_container.dart';
import 'package:school_app/presentation/screen/widgets/screen_title.dart';

class ClassDetailsScreen extends ConsumerWidget {
  const ClassDetailsScreen({super.key, required this.classRoom});
  final ClassRoom classRoom;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(classroomNotifierProvider);
    var subject = ref
        .read(classroomNotifierProvider.notifier)
        .subjectFromClass(classRoom);
    var student = ref
        .read(classroomNotifierProvider.notifier)
        .studentFromClass(classRoom);
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
          ScreenTitle(
            title: classRoom.name,
            withTitleCase: true,
          ),
          SizedBox(height: 32.h),
          (!ref
                  .watch(classroomNotifierProvider.notifier)
                  .subjectExists(classRoom))
              ? GreyContainer(
                  child: Row(
                    children: [
                      const BodyText(title: 'Add Subject'),
                      const Spacer(),
                      CommonBtn(
                        height: 39.h,
                        width: 86.w,
                        callback: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => SubjectListScreen(
                                        viewMode: false,
                                        classRoom: classRoom,
                                      )));
                        },
                        bgColor: kLightGreenColor,
                        child: Text(
                          'Add',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 17.sp,
                            color: kDarkGreenColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : GreyContainer(
                  child: Row(
                    children: [
                      BodyText(title: subject!.name),
                      const Spacer(),
                      CommonBtn(
                        height: 39.h,
                        width: 86.w,
                        callback: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => SubjectListScreen(
                                        viewMode: false,
                                        classRoom: classRoom,
                                      )));
                        },
                        bgColor: kLightGreenColor,
                        child: Text(
                          'Change',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 17.sp,
                            color: kDarkGreenColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
          SizedBox(height: 16.h),
          if (subject == null)
            const SizedBox.shrink()
          else
            student == null
                ? GreyContainer(
                    child: Row(
                      children: [
                        const BodyText(title: 'Add Student'),
                        const Spacer(),
                        CommonBtn(
                          height: 39.h,
                          width: 86.w,
                          callback: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => StudentsListScreen(
                                          viewMode: false,
                                          classRoom: classRoom,
                                        )));
                          },
                          bgColor: kLightGreenColor,
                          child: Text(
                            'Add',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 17.sp,
                              color: kDarkGreenColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : GreyContainer(
                    child: Row(
                      children: [
                        BodyText(title: student.name),
                        const Spacer(),
                        CommonBtn(
                          height: 39.h,
                          width: 86.w,
                          callback: () {
                            ref
                                .read(classroomNotifierProvider.notifier)
                                .removeStudent(classRoom);
                          },
                          bgColor: kLightGreenColor,
                          child: Text(
                            'Remove',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 17.sp,
                              color: kDarkGreenColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
        ],
      ),
    );
  }
}
