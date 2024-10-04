import 'package:everything_is_connected_app/core/utils/common_widgets/background_image.dart';

import 'package:everything_is_connected_app/core/utils/common_widgets/navigation.dart';
import 'package:everything_is_connected_app/core/utils/common_widgets/system_dialogue.dart';
import 'package:everything_is_connected_app/model/image_borde.dart';
import 'package:everything_is_connected_app/model/system_info.dart';
import 'package:everything_is_connected_app/ui/screens/explore_screen.dart';
import 'package:everything_is_connected_app/ui/screens/invetigate_screen.dart';
import 'package:everything_is_connected_app/ui/widgets/category_button.dart';
import 'package:everything_is_connected_app/ui/widgets/choose_system.dart';
import 'package:everything_is_connected_app/ui/widgets/navigation_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;
        bool isMobile = screenWidth < 600;

        double svgWidth = isMobile ? screenWidth * 0.9 : 260.w;

        return Scaffold(
          body: BackgroundImage(
            child: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.only(
                  top: 117.h, // Same top padding
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        SvgPicture.asset(
                          "assets/images/board_frame.svg",
                          width: svgWidth,
                        ),

                        Positioned(
                          left: isMobile ? 30.w : 44.w,
                          top: -20.h,
                          child: CategoryButton(
                            onTap: () {
                              systemDialogue("Atmosphere", SystemInfo().system1,
                                  'assets/images/atmosphere.jpg', context);
                            },
                            text: "Atmosphere",
                          ),
                        ),
                        Positioned(
                          left: isMobile ? 70.w : 90.w,
                          top: -20.h,
                          child: CategoryButton(
                            onTap: () {
                              systemDialogue("Biosphere", SystemInfo().system2,
                                  'assets/images/biosphere (2).png', context);
                            },
                            text: "Biosphere",
                          ),
                        ),
                        Positioned(
                          left: isMobile ? 110.w : 136.w,
                          top: -20.h,
                          child: CategoryButton(
                            onTap: () {
                              systemDialogue(
                                  "hydrosphere",
                                  SystemInfo().system3,
                                  "assets/images/hydrosphere.jpeg",
                                  context);
                            },
                            text: "hydrosphere",
                          ),
                        ),
                        Positioned(
                          left: isMobile ? 150.w : 182.w,
                          top: -20.h,
                          child: CategoryButton(
                            onTap: () {
                              systemDialogue("Geosphere", SystemInfo().system4,
                                  "assets/images/biosphere (2).png", context);
                            },
                            text: "Geosphere",
                          ),
                        ),
                        // Positioned ChooseSystem widgets

                        Positioned(
                            left: 16.w,
                            top: 90.h,
                            child: ChooseSystem(
                              imageBorde: ImageBorde(
                                  border:
                                      "assets/images/image_frame/Ocean Acidification.svg",
                                  image:
                                      "assets/images/Ocean_Acidification_Icon.png"),
                              isMain: true,
                            )),
                        Positioned(
                            left: 109.w,
                            top: 90.h,
                            child: ChooseSystem(
                              imageBorde: ImageBorde(
                                  border:
                                      "assets/images/image_frame/Marine Life.svg",
                                  image: "assets/images/Marine_life_icon.png"),
                              isMain: true,
                            )),
                        Positioned(
                            left: 170.w,
                            top: 90.h,
                            child: ChooseSystem(
                              imageBorde: ImageBorde(
                                  border:
                                      "assets/images/image_frame/Ice Melting.svg",
                                  image: "assets/images/ice_icon.jpg.webp"),
                              isMain: true,
                            )),
                        Positioned(
                            left: 67.w,
                            top: 180.h,
                            child: ChooseSystem(
                              imageBorde: ImageBorde(
                                  border:
                                      "assets/images/image_frame/Greenhouse Gases.svg",
                                  image:
                                      "assets/images/green_icon.png"),
                              isMain: true,
                            )),
                        Positioned(
                            left: 16.w,
                            top: 290.h,
                            child: ChooseSystem(
                              imageBorde: ImageBorde(
                                  border:
                                      "assets/images/image_frame/Global Warming.svg",
                                  image: "assets/images/global_icon.jpg"),
                              isMain: true,
                            )),
                        Positioned(
                            left: 109.w,
                            top: 290.h,
                            child: ChooseSystem(
                              imageBorde: ImageBorde(
                                  border:
                                      "assets/images/image_frame/Wild Fires.svg",
                                  image: "assets/images/wildfires_icon.jpg"),
                              isMain: true,
                            )),
                        Positioned(
                            left: 170.w,
                            top: 250.h,
                            child: ChooseSystem(
                              imageBorde: ImageBorde(
                                  border:
                                      "assets/images/image_frame/Air Quality.svg",
                                  image: "assets/images/Air_Quality_Icon.png"),
                              isMain: true,
                            )),
                        Positioned(
                            left: 220.w,
                            top: 160.h,
                            child: ChooseSystem(
                              imageBorde: ImageBorde(
                                  border:
                                      "assets/images/image_frame/Sea Level Rising.svg",
                                  image: "assets/images/sea_icon.png"),
                              isMain: true,
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 90.h,
                      child: Padding(
                        padding: EdgeInsets.only(left: isMobile ? 80.w : 0.w),
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .center, // Align to the start
                              children: [
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: NavigationButton(
                                      onTap: () {
                                        Navigation.push(
                                            context, ExploreScreen());
                                      },
                                      text: "Explore",
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10.w), // Space between buttons
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: NavigationButton(
                                      onTap: () {
                                        Navigation.push(
                                            context, InvetigateScreen());
                                      },
                                      text: "Investigate",
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
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
