import 'package:everything_is_connected_app/core/utils/common_widgets/background_image.dart';
import 'package:everything_is_connected_app/core/utils/common_widgets/navigation.dart';
import 'package:everything_is_connected_app/core/utils/question.dart';
import 'package:everything_is_connected_app/logic/lineslist_cubit.dart';
import 'package:everything_is_connected_app/model/image_borde.dart';
import 'package:everything_is_connected_app/model/questionmodel.dart';
import 'package:everything_is_connected_app/ui/screens/main_screen.dart';
import 'package:everything_is_connected_app/ui/widgets/animated_arrow.dart';
import 'package:everything_is_connected_app/ui/widgets/animated_line.dart';
import 'package:everything_is_connected_app/ui/widgets/choose_system.dart';
import 'package:everything_is_connected_app/ui/widgets/line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InvestigateScreen extends StatefulWidget {
  InvestigateScreen({super.key, this.mp});
  List<Map<Offset, Offset>?>? mp;

  @override
  State<InvestigateScreen> createState() => _InvestigateScreenState();
}

class _InvestigateScreenState extends State<InvestigateScreen> {
  Future<List<Questionmodel>>? questionsFuture;

  @override
  void initState() {
    super.initState();
    // questionsFuture =
    //     parseQuestionsFromLocalJson(); // Fetch questions asynchronously

    context.read<LineslistCubit>().add(widget.mp ?? []);
  }

  List<Questionmodel> questions = [
    Questionmodel(
        // oa
        "How might changes in ocean chemistry influence the creatures that inhabit these waters?",
        [
          "It promotes fish reproduction",
          "It leads to coral bleaching.",
          "It enhances marine biodiversity.",
          "It reduces water temperature."
        ],
        1,
        "How might changes in ocean chemistry influence the creatures that inhabit these waters?",
        list: [
          {
            Offset(16.w + 10.5.w, 90.h): Offset(109.w + 10.5.w, 45.h),
          },
          {Offset(16.w + 10.5.w, 90.h): Offset(67.w + 10.5.w, 180.h)}
        ]),
    Questionmodel(
      "How does the melting of ice sheets and glaciers contribute to sea level rise?",
      [
        " It decreases the amount of freshwater in the oceans.",
        " It adds more water to the ocean, displacing existing water.",
        " It cools the ocean temperature, causing water to contract.",
        " It increases the amount of ice in the ocean, which leads to higher sea levels."
      ],
      1,
      "Think about what happens to water when ice melts. Does it remain in its solid state, or does it change form and contribute to the overall volume of water in the oceans?",
      list: [{Offset(170.w + 10.5.w, 90.h):Offset(220.w + 10.5.w, 160.h)}]
    ),
    Questionmodel(
        "What might be a consequence of ice sheets melting in polar regions?",
        [
          "Lower sea levels",
          "Rising sea levels",
          "Ocean freezing",
          "Less water in the oceans"
        ],
        1,
        "Reflect on what happens when ice turns to water.",
        list: [
          {Offset(67.w + 10.5.w, 180.h): Offset(170.w + 10.5.w, 90.h)}
        ]),
    Questionmodel(
        "How might the rise in greenhouse gases affect both the climate and ocean chemistry?",
        [
          "They increase sunlight.",
          "They trap heat, warming air and water.",
          "They lower ocean temperatures.",
          "They block harmful substances."
        ],
        1,
        "Consider the dual impact of CO2 on the atmosphere and the ocean.",
        list: [
          {Offset(67.w + 10.5.w, 180.h): Offset(16.w + 10.5.w, 290.h)},
          {Offset(16.w + 10.5.w, 290.h): Offset(109.w + 10.5.w, 290.h)},
        ]),
    Questionmodel(
        "Could rising temperatures be related to the increase in wildfires?",
        [
          "More global cooling",
          "Fewer forests",
          "Faster snow melt",
          "Drier conditions"
        ],
        3,
        "Consider how heat impacts vegetation dryness.",
        list: [
          {Offset(109.w + 10.5.w, 290.h): Offset(170.w + 10.5.w, 250.h)}
        ]),
    Questionmodel(
        "What could wildfires release that affects the air we breathe?",
        [
          "Fresh oxygen",
          "Water vapor",
          "Smoke and harmful particles",
          "Cooler air"
        ],
        2,
        "Think about the smoke and pollutants released.",
        list: [
          {Offset(109.w + 10.5.w, 290.h): Offset(170.w + 10.5.w, 250.h)}
        ]),
    Questionmodel(
      "",
      [],
      0,
      "",
    ),
    Questionmodel(
      "",
      [],
      0,
      "",
    ),
  ];
  List<Map<Offset, Offset>?> list = [];
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
                    Center(child: LayoutBuilder(
                      builder:
                          (BuildContext context, BoxConstraints constraints) {
                        return BlocBuilder<LineslistCubit,
                            List<List<Map<Offset, Offset>?>?>>(
                          builder: (context, lineList) {
                            List<Widget> lines =
                                []; // Create a list to hold line widgets

                            // Iterate over the outer list
                            for (int outerIndex = 0;
                                outerIndex < lineList.length;
                                outerIndex++) {
                              if (lineList[outerIndex] != null) {
                                // Iterate over the inner list of maps
                                for (int innerIndex = 0;
                                    innerIndex < lineList[outerIndex]!.length;
                                    innerIndex++) {
                                  Map<Offset, Offset> currentLine =
                                      lineList[outerIndex]![innerIndex]!;

                                  // Render the last line as AnimatedLine
                                  if (outerIndex == lineList.length - 1 &&
                                      innerIndex ==
                                          lineList[outerIndex]!.length - 1) {
                                    lines.add(AnimatedLine(
                                      start: currentLine.keys.first,
                                      end: currentLine.values.first,
                                    ));
                                  } else {
                                    lines.add(Line(
                                      start: currentLine.keys.first,
                                      end: currentLine.values.first,
                                    ));
                                  }
                                }
                              }
                            }
                            return Stack(
                              alignment: Alignment.center,
                              clipBehavior: Clip.none,
                              children: [
                                SvgPicture.asset(
                                  "assets/images/board_frame.svg",
                                  width: 300.w,
                                ),
                                Positioned(
                                    left: 16.w,
                                    top: 90.h,
                                    child: ChooseSystem(
                                      imageBorde: ImageBorde(
                                          border:
                                              "assets/images/image_frame/Ocean Acidification.svg",
                                          image:
                                              "assets/images/Ocean_Acidification_Icon.png"),
                                      isExplore: true,
                                      question: questions[0],
                                    )),
                                Positioned(
                                    left: 109.w,
                                    top: 40.h,
                                    child: ChooseSystem(
                                      imageBorde: ImageBorde(
                                          border:
                                              "assets/images/image_frame/Marine Life.svg",
                                          image:
                                              "assets/images/Marine_life_icon.png"),
                                      isExplore: true,
                                    )),
                                Positioned(
                                    left: 170.w,
                                    top: 90.h,
                                    child: ChooseSystem(
                                      imageBorde: ImageBorde(
                                          border:
                                              "assets/images/image_frame/Ice Melting.svg",
                                          image:
                                              "assets/images/ice_icon.jpg.webp"),
                                      isExplore: true,
                                      question: questions[1],
                                    )),
                                Positioned(
                                    left: 67.w,
                                    top: 180.h,
                                    child: ChooseSystem(
                                      imageBorde: ImageBorde(
                                          border:
                                              "assets/images/image_frame/Greenhouse Gases.svg",
                                          image:
                                              "assets/images/green_icon.png"),
                                      isExplore: true,
                                      question: questions[2],
                                    )),
                                Positioned(
                                    left: 16.w,
                                    top: 290.h,
                                    child: ChooseSystem(
                                      imageBorde: ImageBorde(
                                          border:
                                              "assets/images/image_frame/Global Warming.svg",
                                          image:
                                              "assets/images/global_icon.jpg"),
                                      isExplore: true,
                                      question: questions[3],
                                    )),
                                Positioned(
                                    left: 109.w,
                                    top: 290.h,
                                    child: ChooseSystem(
                                      imageBorde: ImageBorde(
                                          border:
                                              "assets/images/image_frame/Wild Fires.svg",
                                          image:
                                              "assets/images/wildfires_icon.jpg"),
                                      isExplore: true,
                                      question: questions[4],
                                    )),
                                Positioned(
                                    left: 170.w,
                                    top: 250.h,
                                    child: ChooseSystem(
                                      imageBorde: ImageBorde(
                                          border:
                                              "assets/images/image_frame/Air Quality.svg",
                                          image:
                                              "assets/images/Air_Quality_Icon.png"),
                                      isExplore: true,
                                    )),
                                Positioned(
                                    left: 220.w,
                                    top: 160.h,
                                    child: ChooseSystem(
                                      imageBorde: ImageBorde(
                                          border:
                                              "assets/images/image_frame/Sea Level Rising.svg",
                                          image: "assets/images/sea_icon.png"),
                                      isExplore: true,
                                    )),
                                ...lines
                              ],
                            );
                          },
                        );
                      },
                    )),
                    SizedBox(height: 18.h),
                    Center(
                      child: SvgPicture.asset(
                          "assets/images/Press on any image to Start.svg"),
                    ),
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
