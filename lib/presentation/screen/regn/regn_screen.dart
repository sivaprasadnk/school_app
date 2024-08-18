import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_app/core/common_strings.dart';
import 'package:school_app/core/constant_colors.dart';
import 'package:school_app/presentation/providers.dart';
import 'package:school_app/presentation/regn_data.dart';
import 'package:school_app/presentation/screen/new_regn/new_regn_screen.dart';
import 'package:school_app/presentation/screen/regn_details/regn_details_screen.dart';
import 'package:school_app/presentation/screen/widgets/body_text.dart';
import 'package:school_app/presentation/screen/widgets/common_btn.dart';
import 'package:school_app/presentation/screen/widgets/grey_container.dart';
import 'package:school_app/presentation/screen/widgets/screen_title.dart';

class RegnScreen extends ConsumerWidget {
  const RegnScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.watch(regnNotifierProvider);
    var api = ref.watch(getRegnProvider);

    // var list = ref.watch(regnNotifierProvider.notifier).completedList();
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
          Expanded(
            child: api.when(
              loading: () {
                return const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Spacer(),
                    Center(
                      child: CircularProgressIndicator(),
                    ),
                    Spacer(),
                  ],
                );
              },
              error: (error, stackTrace) {
                return Text('error :$error');
              },
              data: (data) {
                if (data.$2 != null) {
                  return const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Spacer(),
                        Text(errorText),
                        Spacer(),
                      ],
                    ),
                  );
                }
                if (data.$1!.isEmpty) {
                  return const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Spacer(),
                        Text('No data'),
                        Spacer(),
                      ],
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: data.$1!.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var item = data.$1![index];
                    return Padding(
                      padding: EdgeInsets.only(
                        bottom: 8.h,
                      ),
                      child: GestureDetector(
                        onTap: () async {
                          var stud = await ref
                              .read(homeScreenNotifierProvider.notifier)
                              .getStudentDetails(item.student);
                          var subj = await ref
                              .read(homeScreenNotifierProvider.notifier)
                              .getSubjectDetails(item.subject);
                          if (context.mounted) {
                            if (stud.$1 != null && subj.$1 != null) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => RegnDetailsScreen(
                                          regnData: RegnData(
                                              id: item.id,
                                              student: stud.$1!,
                                              subject: subj.$1!))));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text("Something went wrong")));
                            }
                          }
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (_) =>
                          //             RegnDetailsScreen(regnData: item)));
                        },
                        child: GreyContainer(
                          child: Row(
                            children: [
                              BodyText(title: "Registration Id :# ${item.id}"),
                              const Spacer(),
                              const Icon(
                                Icons.arrow_forward_ios_rounded,
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          CommonBtn(
            height: 48.h,
            width: 177.w,
            callback: () {
              ref.watch(regnNotifierProvider.notifier).initRegn();
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const NewRegnScreen()));
            },
            bgColor: kLightBlueColor,
            child: Text(
              'New Registration',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 17.sp,
                color: kDarkBlueColor,
              ),
            ),
          ),
          SizedBox(height: 45.h),
        ],
      ),
    );
  }
}
