import 'package:everything_is_connected_app/core/utils/common_widgets/navigation.dart';
import 'package:everything_is_connected_app/model/image_borde.dart';
import 'package:everything_is_connected_app/model/questionmodel.dart';
import 'package:everything_is_connected_app/ui/screens/explore_info_screen.dart';
import 'package:everything_is_connected_app/ui/screens/info_screen.dart';
import 'package:everything_is_connected_app/ui/screens/question_screen.dart';
import 'package:everything_is_connected_app/ui/widgets/choose_system_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ChooseSystem extends StatelessWidget {
  final bool isMain;
  const ChooseSystem(
      {super.key,
      required this.imageBorde,
      this.index = 0,
      this.isExplore = false,
      this.isMain = false,
      this.question});
  final ImageBorde imageBorde;
  final int index;
  final bool isExplore;
  final Questionmodel? question;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        !isMain
            ? (isExplore
                ? Navigation.push(
                    context,
                    QuestionScreen(
                      image: imageBorde.image,
                      questionmodel: question!,
                    ))
                : Navigation.push(
                    context,
                    ExploreInfoScreen(
                      index: index,
                    )))
            : null;
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 8.h,
            left: 0.3.w,
            child: Image.asset(
              imageBorde.image,
              width: 99,
              height: 96,
              fit: BoxFit.fill,
            ),
          ),
          SvgPicture.asset(imageBorde.border),
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
