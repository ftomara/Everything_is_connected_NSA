import 'package:everything_is_connected_app/core/utils/common_widgets/background_image.dart';
import 'package:everything_is_connected_app/core/utils/common_widgets/navigation.dart';
import 'package:everything_is_connected_app/logic/lineslist_cubit.dart';
import 'package:everything_is_connected_app/main.dart';
import 'package:everything_is_connected_app/model/questionmodel.dart';
import 'package:everything_is_connected_app/ui/screens/main_screen.dart';
import 'package:everything_is_connected_app/ui/widgets/animated_arrow.dart';
import 'package:everything_is_connected_app/ui/widgets/animated_line.dart';
import 'package:everything_is_connected_app/ui/widgets/choose_system.dart';
import 'package:everything_is_connected_app/ui/widgets/line.dart';
// import 'package:everything_is_connected_app/ui/widgets/line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class InvetigateScreen extends StatefulWidget {
  InvetigateScreen({super.key, this.mp});
  Map<Offset, Offset>? mp;

  @override
  State<InvetigateScreen> createState() => _InvetigateScreenState();
}

class _InvetigateScreenState extends State<InvetigateScreen> {
  List<Map<Offset, Offset>?> list = [];
  List<Questionmodel> questions = [
    Questionmodel(
        "How does Arctic sea ice melting contribute to sea level rise?",
        [
          "a. It speeds up the melting of land ice",
          "b. Melting sea ice adds water to the ocean",
          "c. It cools the ocean,causing sea levels to rise",
          "d. It increases cloud cover, raising sea levels"
        ],
        1,
        "answer is b !",
        start: Offset(109.w + 10.5.w, 94.h - 4.h),
        end: Offset(109.w + 10.5.w, 300.h - 4.h)),
    Questionmodel(
        "How does Arctic sea ice melting contribute to sea level rise?",
        [
          "b. Melting sea ice adds water to the ocean",
          "a. It speeds up the melting of land ice",
          "c. It cools the ocean,causing sea levels to rise",
          "d. It increases cloud cover, raising sea levels"
        ],
        1,
        "answer is b !",
        start: Offset(170.w + 10.5.w, 94.h - 4.h),
        end: Offset(220.w + 10.5.w, 170.h - 4.h)),
    Questionmodel(
        "How does Arctic sea ice melting contribute to sea level rise?",
        [
          "c. It cools the ocean,causing sea levels to rise",
          "d. It increases cloud cover, raising sea levels"
              "b. Melting sea ice adds water to the ocean",
          "a. It speeds up the melting of land ice",
        ],
        1,
        "answer is b !",
        start: Offset(109.w + 10.5.w, 94.h - 4.h),
        end: Offset(170.w + 10.5.w, 260.h - 4.h)),
  ];
  @override
  void initState() {
    super.initState();
    context.read<LineslistCubit>().add(widget.mp);
    list = context.read<LineslistCubit>().state;
    print(context.read<LineslistCubit>().state);
    print(list);
  }

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
                        return BlocBuilder<LineslistCubit,
                                List<Map<Offset, Offset>?>>(
                            builder: (context, list) {
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
                                    question: questions[0],
                                  )),
                              Positioned(
                                  left: 109.w,
                                  top: 90.h,
                                  child: ChooseSystem(
                                    isExplore: true,
                                    question: questions[1],
                                  )),
                              Positioned(
                                  left: 170.w,
                                  top: 90.h,
                                  child: ChooseSystem(
                                    isExplore: true,
                                    question: questions[2],
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
                              if (list.isNotEmpty)
                                for (int i = 0; i < list.length; i++)
                                  if (list[i] != null)
                                    if (i ==
                                        list.length -
                                            1) // Check if it's the last line
                                      AnimatedLine(
                                        start: list[i]!.keys.first,
                                        end: list[i]!.values.first,
                                      )
                                    else
                                      Line(
                                        start: list[i]!.keys.first,
                                        end: list[i]!.values.first,
                                      ),
                            ],
                          );
                        });
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
