import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_app/core/constant_colors.dart';
import 'package:school_app/domain/entity/classroom.dart';
import 'package:school_app/presentation/providers.dart';
import 'package:school_app/presentation/screen/subject_list/subject_list_screen.dart';
import 'package:school_app/presentation/screen/widgets/grey_container.dart';
import 'package:school_app/presentation/screen/widgets/screen_title.dart';

class ClassDetailsScreen extends ConsumerWidget {
  const ClassDetailsScreen({super.key, required this.classRoom});
  final ClassRoom classRoom;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(classroomNotifierProvider);

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
          ScreenTitle(title: classRoom.name),
          SizedBox(height: 32.h),

          Consumer(builder: (context, ref, _) {
            ref.watch(classroomNotifierProvider.notifier).printItems();
            return (!ref
                    .watch(classroomNotifierProvider.notifier)
                    .subjectExists(classRoom))
                ? GreyContainer(
                    child: Row(
                      children: [
                        Text(
                          'Add Subject',
                          style: TextStyle(fontSize: 17.sp),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => SubjectListScreen(
                                          viewMode: false,
                                          classRoom: classRoom,
                                        )));
                          },
                          child: Container(
                            height: 39.h,
                            width: 86.w,
                            decoration: BoxDecoration(
                              color: kLightGreenColor,
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Center(
                              child: Text(
                                'Add',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17.sp,
                                  color: kDarkGreenColor,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                : Builder(builder: (context) {
                    var subject = ref
                        .read(classroomNotifierProvider.notifier)
                        .subjectFromClass(classRoom);
                    return GreyContainer(
                      child: Row(
                        children: [
                          Text(
                            subject!.name,
                            style: TextStyle(fontSize: 17.sp),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => SubjectListScreen(
                                            viewMode: false,
                                            classRoom: classRoom,
                                          )));
                            },
                            child: Container(
                              height: 39.h,
                              width: 86.w,
                              decoration: BoxDecoration(
                                color: kLightGreenColor,
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Center(
                                child: Text(
                                  'Change',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 17.sp,
                                    color: kDarkGreenColor,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  });
          })
          // else
          // GreyContainer(
          //   child: Row(
          //     children: [
          //       Text(
          //         subject!.name,
          //         style: TextStyle(fontSize: 17.sp),
          //       ),
          //       const Spacer(),
          //       GestureDetector(
          //         onTap: () {
          //           Navigator.push(
          //               context,
          //               MaterialPageRoute(
          //                   builder: (_) => SubjectListScreen(
          //                         viewMode: false,
          //                         classRoom: classRoom,
          //                       )));
          //         },
          //         child: Container(
          //           height: 39.h,
          //           width: 86.w,
          //           decoration: BoxDecoration(
          //             color: kLightGreenColor,
          //             borderRadius: BorderRadius.circular(10.r),
          //           ),
          //           child: Center(
          //             child: Text(
          //               'Change',
          //               style: TextStyle(
          //                 fontWeight: FontWeight.w600,
          //                 fontSize: 17.sp,
          //                 color: kDarkGreenColor,
          //               ),
          //             ),
          //           ),
          //         ),
          //       )
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}
