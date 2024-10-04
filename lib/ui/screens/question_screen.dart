import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:everything_is_connected_app/constant.dart';

import 'package:everything_is_connected_app/core/utils/my_text_style.dart';
import 'package:everything_is_connected_app/logic/lineslist_cubit.dart';
import 'package:everything_is_connected_app/model/infomodel.dart';
import 'package:everything_is_connected_app/model/questionmodel.dart';
import 'package:everything_is_connected_app/ui/screens/explore_ai_chat.dart';
import 'package:everything_is_connected_app/ui/screens/info_screen.dart';
import 'package:everything_is_connected_app/ui/screens/invetigate_screen.dart';
import 'package:everything_is_connected_app/ui/widgets/answerbtn.dart';
import 'package:everything_is_connected_app/ui/widgets/choose_system.dart';
import 'package:everything_is_connected_app/ui/widgets/choose_system_big.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.questionmodel});
  final Questionmodel questionmodel;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  // final Questionmodel questionmodel = Questionmodel(
  //     "How does Arctic sea ice melting contribute to sea level rise?",
  //     [
  //       "a. It speeds up the melting of land ice",
  //       "b. Melting sea ice adds water to the ocean",
  //       "c. It cools the ocean,causing sea levels to rise",
  //       "d. It increases cloud cover, raising sea levels"
  //     ],
  //     1,
  //     "answer is b !",
  //     start: Offset(109.w + 10.5.w, 94.h - 4.h),
  //     end: Offset(109.w + 10.5.w, 300.h - 4.h));
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
                          widget.questionmodel.question,
                          style: MyTextStyle.textStyle12.copyWith(fontSize: 20),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        for (int i = 0;
                            i < widget.questionmodel.answers.length;
                            i++)
                          Column(
                            children: [
                              Answerbtn(
                                text: widget.questionmodel.answers[i],
                                isCorrect: i == widget.questionmodel.rightindx,
                                isSelected: i == _selectedAnswerIndex,
                                ontap: () {
                                  setState(() {
                                    _selectedAnswerIndex = i;
                                  });
                                  if (i == widget.questionmodel.rightindx) {
                                    Map<Offset, Offset> offsetsMap = {
                                      widget.questionmodel.start!:
                                          widget.questionmodel.end!
                                    };
                                    context
                                        .read<LineslistCubit>()
                                        .add(offsetsMap);

                                    // Pass the map to InvetigateScreen
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            InvetigateScreen(mp: offsetsMap),
                                      ),
                                    );
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
            child: SelectableText(widget.questionmodel.hint),
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
