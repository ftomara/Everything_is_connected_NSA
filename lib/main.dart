import 'package:everything_is_connected_app/constant.dart';
import 'package:everything_is_connected_app/ui/screens/explore_screen.dart';
import 'package:everything_is_connected_app/core/utils/common_widgets/background_image.dart';
import 'package:everything_is_connected_app/ui/screens/category_screen.dart';
import 'package:everything_is_connected_app/ui/screens/explore_ai_chat.dart';
import 'package:everything_is_connected_app/ui/screens/explore_info_screen.dart';
import 'package:everything_is_connected_app/ui/screens/main_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
        // home: MainScreen(),
        home: ExploreAiChat(),
        // home: ExploreInfoScreen(),
      ),
    );
  }
}
