import 'package:everything_is_connected_app/core/utils/common_widgets/navigation.dart';
import 'package:everything_is_connected_app/ui/screens/explore_info_screen.dart';
import 'package:everything_is_connected_app/ui/screens/info_screen.dart';
import 'package:everything_is_connected_app/ui/screens/question_screen.dart';
import 'package:everything_is_connected_app/ui/widgets/choose_system_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ChooseSystem extends StatelessWidget {
  const ChooseSystem({super.key, this.isExplore = false});
  final bool isExplore;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SvgPicture.asset("assets/images/image-frame.svg"),
        Positioned(
          top: 2.5.h,
          left: 0.3.w,
          child: Image.asset(
            "assets/images/Screenshot 2024-09-20 at 10.17.01 PM 1.png",
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          top: -4.h,
          left: 10.5.w,
          child: SvgPicture.asset(
            "assets/images/star_pin.svg",
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
            top: 65.h,
            child: ChooseSystemButton(
              onTap: () {
                isExplore
                    ? Navigation.push(context, QuestionScreen())
                    : Navigation.push(context, ExploreInfoScreen());
              },
              text: "dddd",
            )),
      ],
    );
  }
}
