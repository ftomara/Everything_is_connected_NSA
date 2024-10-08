import 'package:everything_is_connected_app/constant.dart';
import 'package:everything_is_connected_app/core/utils/question.dart';
import 'package:everything_is_connected_app/logic/lineslist_cubit.dart';
import 'package:everything_is_connected_app/ui/screens/explore_screen.dart';
import 'package:everything_is_connected_app/core/utils/common_widgets/background_image.dart';
import 'package:everything_is_connected_app/ui/screens/category_screen.dart';
import 'package:everything_is_connected_app/ui/screens/explore_ai_chat.dart';
import 'package:everything_is_connected_app/ui/screens/explore_info_screen.dart';
import 'package:everything_is_connected_app/ui/screens/intro.dart';
import 'package:everything_is_connected_app/ui/screens/main_screen.dart';
import 'package:everything_is_connected_app/ui/screens/question_screen.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _playBackgroundMusic();
  }

  void _playBackgroundMusic() async {
    // Ensure that the audio loops indefinitely
    await _audioPlayer.setReleaseMode(ReleaseMode.loop);

    // Start playing the background music
    await _audioPlayer.play(UrlSource("assets/images/Sakta.mp3"));
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      splitScreenMode: true,
      minTextAdapt: true,
      child: BlocProvider<LineslistCubit>(
        create: (context) => LineslistCubit(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.transparent,
            textTheme: GoogleFonts.abyssinicaSilTextTheme().apply(
              bodyColor: defaultColor,
            ),
          ),
          home: Intro(), // You can change this to the initial screen of your choice
        ),
      ),
    );
  }
}