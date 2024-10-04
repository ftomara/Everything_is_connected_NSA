import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:everything_is_connected_app/constant.dart';

import 'package:everything_is_connected_app/core/utils/my_text_style.dart';
import 'package:everything_is_connected_app/model/infomodel.dart';
import 'package:everything_is_connected_app/model/questionmodel.dart';
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
  final Questionmodel _questionmodel = Questionmodel(
      "How does Arctic sea ice melting contribute to sea level rise?",
      [
        "a. It speeds up the melting of land ice",
        "b. Melting sea ice adds water to the ocean",
        "c. It cools the ocean,causing sea levels to rise",
        "d. It increases cloud cover, raising sea levels"
      ],
      1,
      "answer is b !");
  int _selectedAnswerIndex = -1;
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
            child: SizedBox(
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
                    width: 8.w,
                  ),
                  // Transform.scale(
                  //   scale: 2.5,
                  //   child: ChooseSystemBig(text: "sea level rise"),
                  // ),
                  Image.asset(
                    "assets/images/greenhouse.png",
                    fit: BoxFit.contain,
                  )
                  // Container(
                  //   margin: EdgeInsets.only(right: 50),
                  //   // color: Colors.green[100],
                  //   decoration: BoxDecoration(
                  //     image: DecorationImage(
                  //       image: AssetImage('assets/images/greenhouse.png'),
                  //       fit: BoxFit.contain,
                  //     ),
                  //   ),
                  //   // width: 50.w,
                  //   // height: 50.h,
                  // )
                  ,
                  SizedBox(
                    width: 8.w,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _questionmodel.question,
                          style: MyTextStyle.textStyle12.copyWith(fontSize: 20),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        for (int i = 0; i < _questionmodel.answers.length; i++)
                          Column(
                            children: [
                              Answerbtn(
                                text: _questionmodel.answers[i],
                                isCorrect: i == _questionmodel.rightindx,
                                isSelected: i == _selectedAnswerIndex,
                                ontap: () {
                                  setState(() {
                                    _selectedAnswerIndex = i;
                                  });
                                  if (i == _questionmodel.rightindx) {
                                    // Correct answer tapped, handle accordingly
                                    print("Correct answer!");
                                  } else {
                                    _showwrong(context);
                                    print("Wrong answer!");
                                  }
                                },
                              ),
                              SizedBox(height: 8),
                            ],
                          ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 48.w,
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
            child: SelectableText(_questionmodel.hint),
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

  void _showwrong(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Color.fromARGB(255, 121, 21, 21),
          title: const Text('Wrong Answer'),
          content: SingleChildScrollView(
            child: SelectableText("Try Again !"),
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
