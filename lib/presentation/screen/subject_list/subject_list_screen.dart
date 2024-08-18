import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_app/data/model/subject_model.dart';
import 'package:school_app/domain/entity/classroom.dart';
import 'package:school_app/presentation/providers.dart';
import 'package:school_app/presentation/screen/subject_detail/subject_detail_screen.dart';
import 'package:school_app/presentation/screen/widgets/body_text.dart';
import 'package:school_app/presentation/screen/widgets/grey_container.dart';
import 'package:school_app/presentation/screen/widgets/screen_title.dart';

class SubjectListScreen extends ConsumerWidget {
  const SubjectListScreen({
    super.key,
    this.viewMode = true,
    this.classRoom,
  });
  final bool viewMode;
  final ClassRoom? classRoom;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var api = ref.watch(getSubjectsProvider);

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
          const ScreenTitle(title: 'Subjects'),
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
                    SubjectModel subj = data.$1![index];
                    return GestureDetector(
                      onTap: () {
                        if (viewMode) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) =>
                                      SubjectDetailScreen(subjectModel: subj)));
                        } else {
                          ref
                              .read(classroomNotifierProvider.notifier)
                              .assignSubject(subj, classRoom!);
                          Navigator.pop(context);
                          // Navigator.pop(context);
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
                                  title: subj.name,
                                ),
                                Text(
                                  subj.teacher,
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                  ),
                                )
                              ],
                            ),
                            const Spacer(),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "${subj.credits}",
                                  style: TextStyle(
                                    fontSize: 17.sp,
                                  ),
                                ),
                                Text(
                                  "Credit",
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                  ),
                                )
                              ],
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
