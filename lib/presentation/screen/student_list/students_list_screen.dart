import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_app/domain/entity/classroom.dart';
import 'package:school_app/presentation/providers.dart';
import 'package:school_app/presentation/screen/student_detail/student_detail_screen.dart';
import 'package:school_app/presentation/screen/widgets/body_text.dart';
import 'package:school_app/presentation/screen/widgets/grey_container.dart';
import 'package:school_app/presentation/screen/widgets/screen_title.dart';

class StudentsListScreen extends ConsumerWidget {
  const StudentsListScreen({
    this.viewMode = true,
    this.registerMode = false,
    this.classRoom,
    super.key,
  });
  final bool viewMode;
  final bool registerMode;
  final ClassRoom? classRoom;

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
                  return const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                        'The server encountered an internal error and was unable to complete your request. Either the server is overloaded or there is an error in the application'),
                  );
                }
                return ListView.builder(
                  itemCount: data.$1!.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var stud = data.$1![index];
                    return GestureDetector(
                      onTap: () {
                        if (viewMode) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) =>
                                      StudentDetailScreen(studentModel: stud)));
                        } else {
                          if (!registerMode) {
                            ref
                                .read(classroomNotifierProvider.notifier)
                                .assignStudent(stud, classRoom!);
                            Navigator.pop(context);
                          } else {
                            ref
                                .read(regnNotifierProvider.notifier)
                                .assignStudent(stud);
                            Navigator.pop(context);
                          }
                        }
                      },
                      child: GreyContainer(
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                BodyText(
                                  title: stud.name,
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
