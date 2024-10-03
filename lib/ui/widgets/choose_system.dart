import 'package:everything_is_connected_app/core/utils/common_widgets/navigation.dart';
import 'package:everything_is_connected_app/ui/screens/explore_info_screen.dart';
import 'package:everything_is_connected_app/ui/screens/info_screen.dart';
import 'package:everything_is_connected_app/ui/screens/question_screen.dart';
import 'package:everything_is_connected_app/ui/widgets/choose_system_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ChooseSystem extends StatelessWidget {
  final bool isMain;
  const ChooseSystem({super.key, this.isExplore = false, this.isMain = false});
  final bool isExplore;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        !isMain
            ? (isExplore
                ? Navigation.push(context, QuestionScreen())
                : Navigation.push(context, ExploreInfoScreen()))
            : null;
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 8.h,
            left: 0.3.w,
            child: Image.asset(
              "assets/images/Screenshot 2024-09-20 at 10.17.01 PM 1.png",
              fit: BoxFit.fill,
            ),
          ),
          SvgPicture.asset("assets/images/image-frame1.svg"),
          // Positioned(
          //     top: MediaQuery.of(context).size.height * 0.100,
          //     child: ChooseSystemButton(
          //       onTap: () {
          //         !isMain
          //             ? (isExplore
          //                 ? Navigation.push(context, QuestionScreen())
          //                 : Navigation.push(context, ExploreInfoScreen()))
          //             : null;
          //       },
          //       text: "dddd",
          //     )),
        ],
      ),
    );
  }
}
