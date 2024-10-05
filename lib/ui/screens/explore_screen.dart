import 'package:everything_is_connected_app/core/utils/common_widgets/background_image.dart';
import 'package:everything_is_connected_app/core/utils/common_widgets/navigation.dart';
import 'package:everything_is_connected_app/model/image_borde.dart';
import 'package:everything_is_connected_app/ui/screens/main_screen.dart';
import 'package:everything_is_connected_app/ui/widgets/animated_arrow.dart';
import 'package:everything_is_connected_app/ui/widgets/choose_system.dart';
import 'package:everything_is_connected_app/ui/widgets/line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;
        bool isMobile = screenWidth < 600;

        return Scaffold(
          body: BackgroundImage(
            child: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.only(
                  top: 70.h,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigation.pushAndRemoveUntil(
                                  context, MainScreen());
                            },
                            child: AnimatedArrow(
                              ontap: () {
                                Navigation.pushAndRemoveUntil(
                                    context, MainScreen());
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    Center(
                      child: LayoutBuilder(
                        builder:
                            (BuildContext context, BoxConstraints constraints) {
                          double svgWidth =
                              isMobile ? screenWidth * 0.9 : 260.w;

                          return Stack(
                            alignment: Alignment.center,
                            clipBehavior: Clip.none,
                            children: [
                              SvgPicture.asset(
                                "assets/images/board_frame.svg",
                                width: svgWidth,
                              ),
                              Positioned(
                                  left: 16.w,
                                  top: 90.h,
                                  child: ChooseSystem(
                                    imageBorde: ImageBorde(
                                        border:
                                            "assets/images/image_frame/Ocean Acidification.svg",
                                        image:
                                            "assets/images/Ocean_Acidification_Icon.png"),
                                    index: 0,
                                  )),
                              Positioned(
                                  left: 109.w,
                                  top: 40.h,
                                  child: ChooseSystem(
                                    imageBorde: ImageBorde(
                                        border:
                                            "assets/images/image_frame/Marine Life.svg",
                                        image:
                                            "assets/images/Marine_life_icon.png"),
                                    index: 1,
                                  )),
                              Positioned(
                                  left: 170.w,
                                  top: 90.h,
                                  child: ChooseSystem(
                                    imageBorde: ImageBorde(
                                        border:
                                            "assets/images/image_frame/Ice Melting.svg",
                                        image:
                                            "assets/images/ice_icon.jpg.webp"),
                                    index: 2,
                                  )),
                              Positioned(
                                  left: 67.w,
                                  top: 180.h,
                                  child: ChooseSystem(
                                    imageBorde: ImageBorde(
                                        border:
                                            "assets/images/image_frame/Greenhouse Gases.svg",
                                        image: "assets/images/green_icon.png"),
                                    index: 3,
                                  )),
                              Positioned(
                                  left: 16.w,
                                  top: 290.h,
                                  child: ChooseSystem(
                                    imageBorde: ImageBorde(
                                        border:
                                            "assets/images/image_frame/Global Warming.svg",
                                        image: "assets/images/global_icon.jpg"),
                                    index: 4,
                                  )),
                              Positioned(
                                  left: 109.w,
                                  top: 290.h,
                                  child: ChooseSystem(
                                    imageBorde: ImageBorde(
                                        border:
                                            "assets/images/image_frame/Wild Fires.svg",
                                        image:
                                            "assets/images/wildfires_icon.jpg"),
                                    index: 5,
                                  )),
                              Positioned(
                                  left: 170.w,
                                  top: 250.h,
                                  child: ChooseSystem(
                                    imageBorde: ImageBorde(
                                        border:
                                            "assets/images/image_frame/Air Quality.svg",
                                        image:
                                            "assets/images/Air_Quality_Icon.png"),
                                    index: 6,
                                  )),
                              Positioned(
                                  left: 220.w,
                                  top: 160.h,
                                  child: ChooseSystem(
                                    imageBorde: ImageBorde(
                                        border:
                                            "assets/images/image_frame/Sea Level Rising.svg",
                                        image: "assets/images/sea_icon.png"),
                                    index: 7,
                                  )),
                              // Lines connecting the systems
/*
                                left: 170.w,
                                  top: 90.h,
                                  */

                              /*
                                    left: 220.w,
                                  top: 160.h,
                                 */
                              Line(
                                  start: Offset(16.w + 10.5.w, 90.h),
                                  end: Offset(109.w + 10.5.w, 45.h)),
                              Line(
                                  start: Offset(16.w + 10.5.w, 90.h),
                                  end: Offset(67.w + 10.5.w, 180.h)),

                              Line(
                                  start: Offset(67.w + 10.5.w, 180.h),
                                  end: Offset(16.w + 10.5.w, 290.h)),

                              Line(
                                  start: Offset(16.w + 10.5.w, 290.h),
                                  end: Offset(109.w + 10.5.w, 290.h)),

                              Line(
                                  start: Offset(109.w + 10.5.w, 290.h),
                                  end: Offset(170.w + 10.5.w, 250.h)),

                              Line(
                                  start: Offset(67.w + 10.5.w, 180.h),
                                  end: Offset(170.w + 10.5.w, 90.h)),
                              Line(
                                  start: Offset(170.w + 10.5.w, 90.h),
                                  end: Offset(220.w + 10.5.w, 160.h)),
                            ],
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 18.h),
                    Center(
                      child: SvgPicture.asset(
                          "assets/images/Press on any image to Start.svg"),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
