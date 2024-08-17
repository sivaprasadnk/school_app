import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_app/presentation/providers.dart';
import 'package:school_app/presentation/screen/student_detail/student_detail_screen.dart';
import 'package:school_app/presentation/screen/widgets/grey_container.dart';
import 'package:school_app/presentation/screen/widgets/screen_title.dart';

class StudentsListScreen extends ConsumerWidget {
  const StudentsListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var api = ref.watch(getStudentsProvider);

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
            child: api.when(
              loading: () {
                return const Center(child: CircularProgressIndicator());
              },
              error: (error, stackTrace) {
                return Text('error :$error');
              },
              data: (data) {
                if (data.$2 != null) {
                  return Text('error :${data.$2}');
                }
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
                                builder: (_) =>
                                    StudentDetailScreen(studentModel: stud)));
                      },
                      child: GreyContainer(
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
            ),
          )
        ],
      ),
    );
  }
}
