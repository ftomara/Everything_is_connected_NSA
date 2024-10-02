import 'package:everything_is_connected_app/core/utils/common_widgets/background_image.dart';
import 'package:everything_is_connected_app/ui/widgets/animated_arrow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class InfoScreen extends StatefulWidget {
  InfoScreen(
      {super.key,
      required this.close,
      required this.arrow,
      required this.list});
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
        child: Stack(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 4.w,
              ),
              Expanded(
                child: Center(
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Stack(
                      children: [
                        SvgPicture.asset(
                          "assets/images/info_board.svg",
                          height: 500.h,
                          width: 1000.w,
                        ),
                        ...widget.list,
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            right: 8.w,
            child: Column(
              children: [
                SizedBox(
                  height: 75.h,
                ),
                widget.close
                    ? GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: SvgPicture.asset(
                          "assets/images/close_icon.svg",
                        ),
                      )
                    : SizedBox.shrink(),
                SizedBox(
                  height: 225.h,
                ),
                widget.arrow
                    ?  Transform(
                            alignment: Alignment.center,
                            transform:
                                Matrix4.rotationY(3.14159), 
                            child: AnimatedArrow(ontap: (){},),
                          )
                  
                    : SizedBox.shrink(),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
