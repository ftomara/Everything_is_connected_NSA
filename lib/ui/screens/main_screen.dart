import 'package:everything_is_connected_app/core/utils/common_widgets/background_image.dart';
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
    return Scaffold(
      body: BackgroundImage(
        child: Padding(
          padding: EdgeInsets.only(
            top: 70.h,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  SvgPicture.asset(
                    "assets/images/board_frame.svg",
                  ),
                  Positioned(
                    left: 44.w,
                    top: -20.h,
                    child: CategoryButton(
                      onTap: () {},
                      text: "Atmosphere",
                    ),
                  ),
                  Positioned(
                    left: 90.w,
                    top: -20.h,
                    child: CategoryButton(
                      onTap: () {},
                      text: "Biosphere",
                    ),
                  ),
                  Positioned(
                    left: 136.w,
                    top: -20.h,
                    child: CategoryButton(
                      onTap: () {},
                      text: "Cryosphere",
                    ),
                  ),
                  Positioned(
                    left: 182.w,
                    top: -20.h,
                    child: CategoryButton(
                      onTap: () {},
                      text: "Geosphere",
                    ),
                  ),
                  Positioned(left: 16.w, top: 94.h, child: ChooseSystem()),
                  Positioned(left: 109.w, top: 94.h, child: ChooseSystem()),
                  Positioned(left: 170.w, top: 94.h, child: ChooseSystem()),
                  Positioned(left: 67.w, top: 183.h, child: ChooseSystem()),
                  Positioned(left: 16.w, top: 300.h, child: ChooseSystem()),
                  Positioned(left: 109.w, top: 300.h, child: ChooseSystem()),
                  Positioned(left: 170.w, top: 260.h, child: ChooseSystem()),
                  Positioned(left: 220.w, top: 170.h, child: ChooseSystem()),
                ],
              ),
              SizedBox(
                height: 18.h,
              ),
              SizedBox(
                height: 100,
                child: Padding(
                  padding: EdgeInsets.only(left: 120.w),
                  child: Row(
                    children: [
                      NavigationButton(onTap: () {}, text: "Explore"),
                      SizedBox(
                        width: 20.w,
                      ),
                      NavigationButton(onTap: () {}, text: "Investigate"),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
