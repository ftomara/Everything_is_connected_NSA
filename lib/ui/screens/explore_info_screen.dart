import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:everything_is_connected_app/core/utils/my_text_style.dart';
import 'package:everything_is_connected_app/model/infomodel.dart';
import 'package:everything_is_connected_app/ui/screens/explore_ai_chat.dart';
import 'package:everything_is_connected_app/ui/screens/info_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ExploreInfoScreen extends StatefulWidget {
  const ExploreInfoScreen({super.key});

  @override
  State<ExploreInfoScreen> createState() => _ExploreInfoScreenState();
}

class _ExploreInfoScreenState extends State<ExploreInfoScreen> {
  int _currentImageIndex = 0;
  int _currentParagraphIndex = 0;

  final _pages = [
    Infomodel(imagepath: 'assets/images/seaice.png', info: [
      '''Shrinking Arctic Ice: Arctic sea ice is rapidly melting, particularly during the summer, with its extent shrinking every year.
Reflective Ice Loss: The loss of Arctic sea ice reduces Earth’s ability to reflect sunlight, which accelerates global warming.
September Minimum: By 2100, Arctic sea ice could almost completely disappear during the summer months if greenhouse gas emissions remain high.''',
      '''The loss of Arctic sea ice reduces Earth’s ability to reflect sunlight, which accelerates global warming.
September Minimum: By 2100, Arctic sea ice could almost completely disappear during the summer months if greenhouse gas emissions remain high.''',
    ]),
    Infomodel(imagepath: "assets/images/greenhouse.png"),
    Infomodel(imagepath: 'assets/images/last.png', info: [
      '''1. Carbon Dioxide (CO₂): Released from burning fossil fuels and deforestation, it's a primary driver of global warming.
2. Methane (CH₄): A potent greenhouse gas from agriculture and fossil fuel extraction, trapping more heat than CO₂.
3. Nitrous Oxide (N₂O): Emitted from agriculture and fossil fuels, it has a long atmospheric lifespan and contributes significantly to warming.
4. Chlorofluorocarbons (CFCs): Industrial chemicals that trap heat and contribute to both ozone depletion and climate change.''',
    ])
  ];

  void _onArrowTap() {
    final currentPage = _pages[_currentImageIndex];

    // If there are paragraphs, scroll through them first
    if (currentPage.info!.isNotEmpty &&
        _currentParagraphIndex < currentPage.info!.length - 1) {
      setState(() {
        _currentParagraphIndex++;
      });
    }
    // Move to the next image if we're at the end of the info
    else if (_currentImageIndex < _pages.length - 1) {
      setState(() {
        _currentImageIndex++;
        _currentParagraphIndex = 0; // Reset paragraph index for new image
      });
    }
  }

  void _onArrowTapBack() {
    final currentPage = _pages[_currentImageIndex];

    // If there are paragraphs, scroll through them first
    if (currentPage.info!.isNotEmpty && _currentParagraphIndex > 0) {
      setState(() {
        _currentParagraphIndex--;
      });
    }
    // Move to the next image if we're at the end of the info
    else if (_currentImageIndex > 0) {
      setState(() {
        _currentImageIndex--;
        _currentParagraphIndex = _pages[_currentImageIndex].info!.isNotEmpty
            ? _pages[_currentImageIndex].info!.length -
                1 // Go to the last paragraph of the previous image
            : 0; // If there are no paragraphs, reset to 0
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentPage = _pages[_currentImageIndex];
    final bool hasParagraphs = currentPage.info!.isNotEmpty;

    return InfoScreen(
      arrowback: _currentImageIndex > 0 || _currentParagraphIndex > 0,
      ontapback: _onArrowTapBack,
      ontap: _onArrowTap, // Passing the ontap function
      close: true,
      arrow: _currentImageIndex < _pages.length-1,
      list: [
        Positioned(
          left: 8.dg,
          top: 6.dg,
          child: SizedBox(
            // margin: EdgeInsets.symmetric(horizontal: 12),
            // padding: EdgeInsets.symmetric(horizontal: 8),
            // color: Colors.red[100],
            width: 285.w,
            height: 380.h,
            child: Center(
              child: hasParagraphs
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          currentPage.imagepath ?? "",
                          fit: BoxFit.contain,
                          width: 200.w,
                          height: 200.h,
                        ),
                        SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.only(left: 24),
                          child: Text(
                            currentPage.info![_currentParagraphIndex],
                            style:
                                MyTextStyle.textStyle12.copyWith(fontSize: 18),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(height: 20),
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
              AnimatedTextKit(animatedTexts: [
                TyperAnimatedText(
                  "Need to Know More? Let's Have a Chat!",
                  textStyle: MyTextStyle.textStyle12.copyWith(fontSize: 24),
                ),
              ]),
            ],
          ),
        ),
      ],
    );
  }
}
