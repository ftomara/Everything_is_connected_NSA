import 'package:everything_is_connected_app/ui/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    initializeVideoPlayer();
  }

  Future<void> initializeVideoPlayer() async {
    // Initialize the video player
    _controller = VideoPlayerController.asset('assets/images/intro.mp4');

    // Mute the video to allow autoplay in browsers like Chrome
    await _controller.setVolume(0);

    // Wait for the video to initialize before updating the UI
    await _controller.initialize();

    // Start playing the video once it's initialized
    setState(() {
      _controller.play();
    });

    // Listen for the end of the video and navigate to the next page
    _controller.addListener(() {
      if (_controller.value.isInitialized &&
          !_controller.value.isPlaying &&
          _controller.value.position == _controller.value.duration) {
        // Navigate to the MainScreen when the video finishes
        Navigator.pushReplacement(context, _createRoute());
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // Always dispose the controller to free resources
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: _controller.value.isInitialized
            ? SizedBox.expand(
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: _controller.value.size.width,
                    height: _controller.value.size.height,
                    child: VideoPlayer(_controller),
                  ),
                ),
              )
            : CircularProgressIndicator(), // Show a loader until the video is initialized
      ),
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => MainScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
