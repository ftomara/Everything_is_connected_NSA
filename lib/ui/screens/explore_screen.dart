import 'package:everything_is_connected_app/core/utils/common_widgets/background_image.dart';

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
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: BackgroundImage(
        child: Padding(
          padding:
              EdgeInsets.only(top: screenHeight * .1, left: screenWidth * .03),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                      onTap: () {},
                      child: AnimatedArrow(
                        ontap: () {},
                      ))
                ],
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
                      Positioned(left: 16.w, top: 94.h, child: ChooseSystem()),
                      Positioned(left: 109.w, top: 94.h, child: ChooseSystem()),
                      Positioned(
                          left: 170.w, top: 94.h, child: ChooseSystem()), //
                      Positioned(left: 67.w, top: 183.h, child: ChooseSystem()),
                      Positioned(left: 16.w, top: 300.h, child: ChooseSystem()),
                      Positioned(
                          left: 109.w, top: 300.h, child: ChooseSystem()),
                      Positioned(
                          left: 170.w, top: 260.h, child: ChooseSystem()),
                      Positioned(
                          left: 220.w, top: 170.h, child: ChooseSystem()), //

                      Line(
                        start: Offset(170.w + 10.5.w, 94.h - 4.h),
                        end: Offset(220.w + 10.5.w, 170.h - 4.h),
                      ),
                      Line(
                        start: Offset(170.w + 10.5.w, 94.h - 4.h),
                        end: Offset(109.w + 10.5.w, 300.h - 4.h),
                      ),
                      Line(
                        start: Offset(109.w + 10.5.w, 94.h - 4.h),
                        end: Offset(170.w + 10.5.w, 260.h - 4.h),
                      ),
                      Line(
                        start: Offset(109.w + 10.5.w, 94.h - 4.h),
                        end: Offset(109.w + 10.5.w, 300.h - 4.h),
                      ),
                      Line(
                        start: Offset(67.w + 10.5.w, 183.h - 4.h),
                        end: Offset(109.w + 10.5.w, 300.h - 4.h),
                      ),
                      Line(
                        start: Offset(16.w + 10.5.w, 94.h - 4.h),
                        end: Offset(67.w + 10.5.w, 183.h - 4.h),
                      ),
                      Line(
                        start: Offset(67.w + 10.5.w, 183.h - 4.h),
                        end: Offset(16.w + 10.5.w, 300.h - 4.h),
                      ),
                    ],
                  );
                }),
              ),
              Center(
                  child: SvgPicture.asset(
                      "assets/images/Press on any image to Start.svg"))
            ],
          ),
        ),
      ),
    );
  }
}
