import 'package:feed_spaces/features/feed_spaces/ui/feed_spaces_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(393, 1032),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: 'Feed Spaces',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: FeedSpacesScreen(),
      ),
    );
  }
}
