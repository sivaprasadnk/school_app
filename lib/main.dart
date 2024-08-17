import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_app/core/constant_colors.dart';
import 'package:school_app/presentation/screen/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      child: const HomeScreen(),
      builder: (context, child) {
        return ProviderScope(
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'School App',
            theme: ThemeData(
              appBarTheme: const AppBarTheme(
                backgroundColor: kWhiteColor,
                scrolledUnderElevation: 0,
              ),
              scaffoldBackgroundColor: kWhiteColor,
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: child,
          ),
        );
      },
    );
  }
}
