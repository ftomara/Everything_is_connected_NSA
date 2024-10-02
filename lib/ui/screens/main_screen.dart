import 'package:everything_is_connected_app/core/utils/common_widgets/background_image.dart';
import 'package:everything_is_connected_app/core/utils/common_widgets/navigation.dart';
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
                          onTap: () {},
                          text: "Atmosphere",
                        ),
                      ),
                      Positioned(
                        left: isMobile ? 70.w : 90.w,
                        top: -20.h,
                        child: CategoryButton(
                          onTap: () {},
                          text: "Biosphere",
                        ),
                      ),
                      Positioned(
                        left: isMobile ? 110.w : 136.w,
                        top: -20.h,
                        child: CategoryButton(
                          onTap: () {},
                          text: "Cryosphere",
                        ),
                      ),
                      Positioned(
                        left: isMobile ? 150.w : 182.w,
                        top: -20.h,
                        child: CategoryButton(
                          onTap: () {},
                          text: "Geosphere",
                        ),
                      ),
                      // Positioned ChooseSystem widgets
                      Positioned(
                        left: isMobile
                            ? 16.w
                            : 16.w, // Keep positions consistent unless mobile
                        top: 94.h,
                        child: ChooseSystem(),
                      ),
                      Positioned(
                        left: isMobile ? 90.w : 109.w,
                        top: 94.h,
                        child: ChooseSystem(),
                      ),
                      Positioned(
                        left: isMobile ? 140.w : 170.w,
                        top: 94.h,
                        child: ChooseSystem(),
                      ),
                      Positioned(
                        left: isMobile ? 50.w : 67.w,
                        top: 183.h,
                        child: ChooseSystem(),
                      ),
                      Positioned(
                        left: isMobile ? 16.w : 16.w,
                        top: 300.h,
                        child: ChooseSystem(),
                      ),
                      Positioned(
                        left: isMobile ? 90.w : 109.w,
                        top: 300.h,
                        child: ChooseSystem(),
                      ),
                      Positioned(
                        left: isMobile ? 140.w : 170.w,
                        top: 260.h,
                        child: ChooseSystem(),
                      ),
                      Positioned(
                        left: isMobile ? 180.w : 220.w,
                        top: 170.h,
                        child: ChooseSystem(),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 90.h,
                    child: Padding(
                      padding: EdgeInsets.only(left: isMobile ? 80.w : 0.w),
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return Row(
                            mainAxisAlignment:
                                MainAxisAlignment.center, // Align to the start
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: NavigationButton(
                                    onTap: () {
                                      Navigation.push(context, ExploreScreen());
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
        );
      },
    );
  }
}
