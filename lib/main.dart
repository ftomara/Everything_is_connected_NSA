import 'package:everything_is_connected_app/constant.dart';
import 'package:everything_is_connected_app/ui/screens/explore_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      splitScreenMode: true,
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.transparent,
          textTheme: GoogleFonts.abyssinicaSilTextTheme().apply(
            bodyColor: defaultColor,
          ),
        ),
        home: ExploreScreen(),
      ),
    );
  }
}
