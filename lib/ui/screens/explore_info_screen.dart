import 'package:everything_is_connected_app/core/utils/my_text_style.dart';
import 'package:everything_is_connected_app/ui/screens/info_screen.dart';
import 'package:everything_is_connected_app/ui/widgets/choose_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ExploreInfoScreen extends StatefulWidget {
  const ExploreInfoScreen({super.key});

  @override
  State<ExploreInfoScreen> createState() => _ExploreInfoScreenState();
}

class _ExploreInfoScreenState extends State<ExploreInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return InfoScreen(close: true, arrow: true, list: [
      Positioned(
        left: 45.dg,
        top: 40.dg,
        child: Transform.scale(
          scale: 0.7.dg,
          child: ChooseSystem(),
        ),
      ),
      Positioned(
        bottom: 24,
        left: 20,
        child: Row(
        children: [
          SvgPicture.asset("assets/images/ai_avatar.svg"),
          SizedBox(width: 4.w,),
          Text("Need to Know More ? Let's Have a Chat !" , style: MyTextStyle.textStyle12.copyWith(fontSize: 24),),
        ],
      ))
    ]);
  }
}
