import 'package:everything_is_connected_app/core/utils/common_widgets/background_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class InfoScreen extends StatefulWidget {
  InfoScreen({super.key, required this.close, required this.arrow , required this.list});
  bool arrow = true;
  bool close = false;
  List<Widget> list = [];

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundImage(
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(top: 24.dg),
              child: Center(
                child: Row(
                  children: [
                    SizedBox(
                      width: 20.w,
                    ),
                    Stack(
                      children: [
                        SvgPicture.asset(
                          "assets/images/info_board.svg",
                          width: 1107.w, // Use appropriate scaling values
                          height: 542.h, // Use appropriate scaling values
                        ),
                        ...widget.list,
                      ],
                    ),
                    Column(
                      children: [
                       widget.close?
                        GestureDetector(
                          onTap: () {},
                          child: SvgPicture.asset(
                            "assets/images/close_icon.svg",
                          ),
                        ):SizedBox.shrink(),
                        SizedBox(
                          height: 240.h,
                        ),
                        widget.arrow?
                        Center(
                          child: GestureDetector(
                            onTap: () {},
                            child: Transform(
                              alignment: Alignment.center,
                              transform: Matrix4.rotationY(
                                  3.14159), // 180 degrees flip
                              child: SvgPicture.asset(
                                "assets/images/ArrowLeft&Right.svg",
                              ),
                            ),
                          ),
                        ):
                        SizedBox.shrink(),
                      ],
                    ),
                    // SizedBox(width: 6.w),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
