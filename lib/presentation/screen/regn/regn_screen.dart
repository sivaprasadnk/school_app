import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_app/core/constant_colors.dart';
import 'package:school_app/presentation/providers.dart';
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
    ref.watch(regnNotifierProvider);

    var list = ref.watch(regnNotifierProvider.notifier).completedList();
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
          list.isEmpty
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 254.h),
                    const BodyText(
                      title: 'No data',
                    ),
                    SizedBox(height: 284.h),
                  ],
                )
              : Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 32.h),
                      ListView.builder(
                        itemCount: list.length,
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          var item = list[index];
                          return Padding(
                            padding: EdgeInsets.only(
                              bottom: 8.h,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) =>
                                            RegnDetailsScreen(regnData: item)));
                              },
                              child: GreyContainer(
                                child: Row(
                                  children: [
                                    BodyText(
                                        title:
                                            "Registration Id :# ${item.id!}"),
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
                      )
                    ],
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
