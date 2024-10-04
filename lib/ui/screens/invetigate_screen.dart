import 'package:everything_is_connected_app/core/utils/common_widgets/background_image.dart';
import 'package:everything_is_connected_app/core/utils/common_widgets/navigation.dart';
import 'package:everything_is_connected_app/core/utils/question.dart';
import 'package:everything_is_connected_app/logic/lineslist_cubit.dart';
import 'package:everything_is_connected_app/main.dart';
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

class InvetigateScreen extends StatefulWidget {
  InvetigateScreen({super.key, this.mp});
  final Map<Offset, Offset>? mp;

  @override
  State<InvetigateScreen> createState() => _InvetigateScreenState();
}

class _InvetigateScreenState extends State<InvetigateScreen> {
  Future<List<Questionmodel>>? questionsFuture;

  @override
  void initState() {
    super.initState();
    questionsFuture =
        parseQuestionsFromLocalJson(); // Fetch questions asynchronously

    // Adding the lines map from widget's argument to the cubit's state
    context.read<LineslistCubit>().add(widget.mp);
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
                padding: EdgeInsets.only(top: 70.h),
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
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: FutureBuilder<List<Questionmodel>>(
                        future: questionsFuture,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator(); // Show a loading spinner
                          } else if (snapshot.hasError) {
                            return Text(
                                'Error loading questions: ${snapshot.error}');
                          } else if (!snapshot.hasData ||
                              snapshot.data!.isEmpty) {
                            return Text('No questions available');
                          }

                          List<Questionmodel> questions = snapshot.data!;

                          return LayoutBuilder(
                            builder: (BuildContext context,
                                BoxConstraints constraints) {
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
                                          imageBorde: ImageBorde(
                                              border:
                                                  "assets/images/image_frame/Ocean Acidification.svg",
                                              image:
                                                  "assets/images/Ocean_Acidification_Icon.png"),
                                          isExplore: true,
                                          question: questions[0],
                                        ),
                                      ),
                                      Positioned(
                                        left: 109.w,
                                        top: 90.h,
                                        child: ChooseSystem(
                                          imageBorde: ImageBorde(
                                              border:
                                                  "assets/images/image_frame/Marine Life.svg",
                                              image:
                                                  "assets/images/Marine_life_icon.png"),
                                          isExplore: true,
                                        ),
                                      ),
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
                                        ),
                                      ),
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
                                        ),
                                      ),
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
                                        ),
                                      ),
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
                                        ),
                                      ),
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
                                        ),
                                      ),
                                      Positioned(
                                        left: 220.w,
                                        top: 160.h,
                                        child: ChooseSystem(
                                          imageBorde: ImageBorde(
                                              border:
                                                  "assets/images/image_frame/Sea Level Rising.svg",
                                              image:
                                                  "assets/images/sea_icon.png"),
                                          isExplore: true,
                                        ),
                                      ),
                                      if (list.isNotEmpty)
                                        for (int i = 0; i < list.length; i++)
                                          if (list[i] != null)
                                            if (i == list.length - 1)
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
                                },
                              );
                            },
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 18.h),
                    Center(
                      child: SvgPicture.asset(
                        "assets/images/Press on any image to Start Your Investigation.svg",
                      ),
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
