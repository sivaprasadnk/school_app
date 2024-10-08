import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_app/presentation/providers.dart';
import 'package:school_app/presentation/screen/widgets/home_screen_grid.dart';
import 'package:school_app/presentation/screen/widgets/home_screen_list.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var isGridView = ref.watch(homeScreenNotifierProvider);

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 72.h),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Hello,',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 28.sp,
                      ),
                    ),
                    Text(
                      'Good Morning',
                      style: TextStyle(
                        fontSize: 22.sp,
                      ),
                    )
                  ],
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    ref.read(homeScreenNotifierProvider.notifier).toggleView();
                  },
                  child: isGridView
                      ? Image.asset(
                          'assets/images/menu.png',
                          height: 32.h,
                          width: 32.w,
                        )
                      : Image.asset(
                          'assets/images/grid.png',
                          height: 32.h,
                          width: 32.w,
                        ),
                )
              ],
            ),
            isGridView ? SizedBox(height: 57.h) : SizedBox(height: 131.h),
            isGridView ? const HomeScreenGrid() : const HomeScreenList()
          ],
        ),
      ),
    );
  }
}
