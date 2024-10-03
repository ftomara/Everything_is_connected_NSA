import 'package:everything_is_connected_app/core/utils/common_widgets/background_image.dart';
import 'package:everything_is_connected_app/core/utils/common_widgets/navigation.dart';
import 'package:everything_is_connected_app/ui/screens/main_screen.dart';
import 'package:everything_is_connected_app/ui/widgets/animated_arrow.dart';
import 'package:everything_is_connected_app/ui/widgets/animated_line.dart';
import 'package:everything_is_connected_app/ui/widgets/choose_system.dart';
import 'package:everything_is_connected_app/ui/widgets/line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InvetigateScreen extends StatelessWidget {
  const InvetigateScreen({super.key});

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
                      child: LayoutBuilder(builder:
                          (BuildContext context, BoxConstraints constraints) {
                        return Stack(
                          alignment: Alignment.center,
                          clipBehavior: Clip.none,
                          children: [
                      
                            SvgPicture.asset(
                              "assets/images/board_frame.svg",
                            ),
                            Positioned(
                                left: 16.w,
                                top: 90.h,
                                child: ChooseSystem(
                                  isExplore: true,
                                )),
                            Positioned(
                                left: 109.w,
                                top: 90.h,
                                child: ChooseSystem(
                                  isExplore: true,
                                )),
                            Positioned(
                                left: 170.w,
                                top: 90.h,
                                child: ChooseSystem(
                                  isExplore: true,
                                )),
                            Positioned(
                                left: 67.w,
                                top: 180.h,
                                child: ChooseSystem(
                                  isExplore: true,
                                )),
                            Positioned(
                                left: 16.w,
                                top: 290.h,
                                child: ChooseSystem(
                                  isExplore: true,
                                )),
                            Positioned(
                                left: 109.w,
                                top: 290.h,
                                child: ChooseSystem(
                                  isExplore: true,
                                )),
                            Positioned(
                                left: 170.w,
                                top: 250.h,
                                child: ChooseSystem(
                                  isExplore: true,
                                )),
                            Positioned(
                                left: 220.w,
                                top: 160.h,
                                child: ChooseSystem(
                                  isExplore: true,
                                )),
                          ],
                        );
                      }),
                    ),
                    SizedBox(
                      height: 18.h,
                    ),
                    Center(
                        child: SvgPicture.asset(
                      "assets/images/Press on any image to Start Your Investigation.svg",
                    ))
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
