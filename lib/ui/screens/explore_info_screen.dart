import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:everything_is_connected_app/core/utils/data.dart';
import 'package:everything_is_connected_app/core/utils/my_text_style.dart';
import 'package:everything_is_connected_app/model/infomodel.dart';
import 'package:everything_is_connected_app/ui/screens/explore_ai_chat.dart';
import 'package:everything_is_connected_app/ui/screens/info_screen.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:video_player/video_player.dart';

class ExploreInfoScreen extends StatefulWidget {
  const ExploreInfoScreen(
      {super.key, this.isVideo = false, required this.index});
  final bool isVideo;
  final int index;

  @override
  State<ExploreInfoScreen> createState() => _ExploreInfoScreenState();
}

class _ExploreInfoScreenState extends State<ExploreInfoScreen> {
  late FlickManager flickManager;
  int _currentImageIndex = 0;
  int _currentParagraphIndex = 0;

  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
        videoPlayerController: VideoPlayerController.networkUrl(Uri.parse(
            "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4")));
  }

  void _onArrowTap(List<Infomodel> pages) {
    final currentPage = pages[_currentImageIndex];

    // If there are paragraphs, scroll through them first
    if (currentPage.info!.isNotEmpty &&
        _currentParagraphIndex < currentPage.info!.length - 1) {
      setState(() {
        _currentImageIndex++;
        _currentParagraphIndex++;
      });
    }
    // Move to the next image if we're at the end of the info
    else if (_currentImageIndex < pages.length - 1) {
      setState(() {
        _currentImageIndex++;
        _currentParagraphIndex = 0; // Reset paragraph index for new image
      });
    }
  }

  void _onArrowTapBack(List<Infomodel> pages) {
    final currentPage = pages[_currentImageIndex];

    // If there are paragraphs, scroll through them first
    if (currentPage.info!.isNotEmpty && _currentParagraphIndex > 0) {
      setState(() {
        _currentImageIndex--;
        _currentParagraphIndex--;
      });
    }
    // Move to the previous image if we're at the beginning of the info
    else if (_currentImageIndex > 0) {
      setState(() {
        _currentImageIndex--;
        _currentParagraphIndex = pages[_currentImageIndex].info!.isNotEmpty
            ? pages[_currentImageIndex].info!.length -
                1 // Go to last paragraph of the previous image
            : 0; // If there are no paragraphs, reset to 0
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Infomodel>>(
      future: getAllEventInfo(widget.index), // Fetch the data
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child: CircularProgressIndicator()); // Show loading spinner
        } else if (snapshot.hasError) {
          return Center(
              child: Text("Error: ${snapshot.error}")); // Handle error
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text("No data found")); // Handle no data
        }

        final List<Infomodel> pages = snapshot.data!; // Get the data

        // Use the data to access the current page
        final currentPage = pages[_currentImageIndex];
        print(currentPage.imagepath);
        print(_currentImageIndex);
        final bool hasParagraphs = currentPage.info!.isNotEmpty;

        return InfoScreen(
          arrowback: _currentImageIndex > 0 || _currentParagraphIndex > 0,
          ontapback: () => _onArrowTapBack(pages),
          ontap: () => _onArrowTap(pages), // Pass the pages to the tap function
          close: true,
          arrow: _currentImageIndex < pages.length - 1,
          list: [
            Positioned(
              left: 1.w,
              top: 6.dg,
              child: SizedBox(
                width: 285.w,
                height: 380.h,
                child: Center(
                  child: hasParagraphs
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(width: 24.w),
                            currentPage.isVideo!
                                ? Center(
                                    child: SizedBox(
                                      width: 120.w,
                                      height: 200.h,
                                      child: FlickVideoPlayer(
                                        flickManager: flickManager,
                                      ),
                                    ),
                                  )
                                : Image.asset(
                                    currentPage.imagepath ?? "",
                                    fit: BoxFit.contain,
                                    width: 120.w,
                                    height: 200.h,
                                  ),
                            SizedBox(width: 8),
                            Expanded(
                              flex: 4,
                              child: Text(
                                currentPage.info!.join(
                                    '\n'), // Join the list items with a newline character
                                style: MyTextStyle.textStyle12.copyWith(
                                  fontSize: 18,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            SizedBox(width: 36.w),
                          ],
                        )
                      : Center(
                          child: Image.asset(
                            currentPage.imagepath ?? "",
                            fit: BoxFit.contain,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ),
                ),
              ),
            ),
            Positioned(
              bottom: 24,
              left: 20,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ExploreAiChat(),
                        ),
                      );
                    },
                    child: SvgPicture.asset("assets/images/ai_avatar.svg"),
                  ),
                  SizedBox(width: 4.w),
                  AnimatedTextKit(
                    animatedTexts: [
                      TyperAnimatedText(
                        "Need to Know More? Let's Have a Chat!",
                        textStyle:
                            MyTextStyle.textStyle12.copyWith(fontSize: 24),
                      ),
                    ],
                    isRepeatingAnimation: false,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
