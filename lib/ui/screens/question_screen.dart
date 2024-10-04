import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:everything_is_connected_app/constant.dart';

import 'package:everything_is_connected_app/core/utils/my_text_style.dart';
import 'package:everything_is_connected_app/model/infomodel.dart';
import 'package:everything_is_connected_app/ui/screens/explore_ai_chat.dart';
import 'package:everything_is_connected_app/ui/screens/info_screen.dart';
import 'package:everything_is_connected_app/ui/widgets/answerbtn.dart';
import 'package:everything_is_connected_app/ui/widgets/choose_system.dart';
import 'package:everything_is_connected_app/ui/widgets/choose_system_big.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  Widget build(BuildContext context) {
    return InfoScreen(
      arrowback: false,
      ontap: () {},
      close: true,
      arrow: false,
      list: [
        Positioned(
          left: 8.dg,
          top: 6.dg,
          child: Center(
            child: Container(
              // margin: EdgeInsets.symmetric(horizontal: 12),
              // padding: EdgeInsets.symmetric(horizontal: 8),
              // color: Colors.red[100],
              width: 285.w,
              height: 380.h,
              child: Center(
                  child: Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 30.w,
                  ),
                  Transform.scale(
                    scale: 2.5,
                    child: ChooseSystemBig(text: "sea level rise"),
                  ),
                  // Container(
                  //   margin: EdgeInsets.only(right: 50),
                  //   color: Colors.green[100],
                  //   width: 50.w,
                  //   height: 50.w,
                  // ),
                  SizedBox(
                    width: 30.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "question.....?",
                        style: MyTextStyle.textStyle12.copyWith(fontSize: 36),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Answerbtn(
                        text:
                            "a. answer1 hjkhdfkhsaeiurhiuweghriahdkfhzskdfhkashdfkdsah",
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Answerbtn(text: "a. answer1"),
                      SizedBox(
                        height: 8,
                      ),
                      Answerbtn(text: "a. answer1"),
                      SizedBox(
                        height: 8,
                      ),
                      Answerbtn(text: "a. answer1"),
                    ],
                  ),
                  SizedBox(
                    width: 24.w,
                  ),
                ],
              )),
            ),
          ),
        ),
        Positioned(
          bottom: 24,
          left: 20,
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  _showhint("here is your hint", context);
                },
                child: SvgPicture.asset("assets/images/hint.svg"),
              ),
              SizedBox(width: 4.w),
              AnimatedTextKit(animatedTexts: [
                TyperAnimatedText(
                  "Confused ? Click for Hint",
                  textStyle: MyTextStyle.textStyle12.copyWith(fontSize: 24),
                ),
              ]),
            ],
          ),
        ),
      ],
    );
  }

  void _showhint(String message, BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Color(0xFF0C384C),
          title: const Text('Hint'),
          content: SingleChildScrollView(
            child: SelectableText(message),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'OK',
                style: MyTextStyle.textStyle12
                    .copyWith(fontSize: 12, color: defaultColor),
              ),
            )
          ],
        );
      },
    );
  }
}
