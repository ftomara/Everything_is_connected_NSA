import 'package:everything_is_connected_app/core/utils/common_widgets/linear_color.dart';
import 'package:everything_is_connected_app/core/utils/my_text_style.dart';
import 'package:everything_is_connected_app/ui/widgets/choose_system_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class ChooseSystemBig extends StatelessWidget {
  ChooseSystemBig({super.key, this.text});
  String? text = '';
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SvgPicture.asset("assets/images/image-frame.svg"),
        Positioned(
          top: 2.5.h,
          left: 0.3.w,
          child: Image.asset(
            "assets/images/Screenshot 2024-09-20 at 10.17.01 PM 1.png",
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          top: -4.h,
          left: 9.5.w,
          child: SvgPicture.asset(
            "assets/images/star_pin.svg",
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 57.h,
          // left: -3.5.w,
          right: -5.w,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  "assets/images/HexTech_Glod.svg",
                  width: 20,
                  height: 20,
                  fit: BoxFit.contain,
                ),
              ),

              // Centered text
              Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 14.h, horizontal: 10.w),
                  child: LinearColor(
                    widget: Text(text ?? "",
                        style: MyTextStyle.textStyle8.copyWith(
                          shadows: <Shadow>[
                            Shadow(
                                offset: Offset(0, 0.5),
                                blurRadius: 0.5,
                                color: Colors.white.withOpacity(0.5)),
                          ],
                          color: Colors.white,
                        )),
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
