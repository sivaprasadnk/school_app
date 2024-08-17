import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_app/core/constant_colors.dart';
import 'package:school_app/presentation/providers.dart';
import 'package:school_app/presentation/screen/student_detail/student_detail_screen.dart';
import 'package:school_app/presentation/screen/widgets/screen_title.dart';

class StudentsListScreen extends StatelessWidget {
  const StudentsListScreen({super.key});

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
          const ScreenTitle(title: 'Students'),
          SizedBox(height: 32.h),
          Expanded(
            child: Consumer(
              builder: (context, ref, child) {
                var api = ref.watch(getStudentsProvider);
                return api.when(
                  loading: () {
                    return const Center(child: CircularProgressIndicator());
                  },
                  error: (error, stackTrace) {
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //   SnackBar(
                    //     content: Text(error.toString()),
                    //   ),
                    // );
                    return Text('error :$error');
                  },
                  data: (data) {
                    return ListView.builder(
                      itemCount: data.$1!.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        var stud = data.$1![index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => StudentDetailScreen(
                                        studentModel: stud)));
                          },
                          child: Container(
                            height: 70.h,
                            margin: EdgeInsets.only(
                                bottom: 16.h, left: 16.w, right: 16.w),
                            padding: EdgeInsets.only(
                              left: 22.w,
                              top: 13.h,
                              bottom: 14.h,
                              right: 22.w,
                            ),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: kLightGreyColor,
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      stud.name,
                                      style: TextStyle(
                                        fontSize: 17.sp,
                                      ),
                                    ),
                                    Text(
                                      stud.email,
                                      style: TextStyle(
                                        fontSize: 13.sp,
                                      ),
                                    )
                                  ],
                                ),
                                const Spacer(),
                                Text(
                                  "Age : ${stud.age}",
                                  style: TextStyle(
                                    fontSize: 17.sp,
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
