import 'package:everything_is_connected_app/core/utils/common_widgets/linear_color.dart';
import 'package:everything_is_connected_app/core/utils/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class NavigationButton extends StatefulWidget {
  const NavigationButton({super.key, required this.onTap, required this.text});
  final Function() onTap;
  final String text;

  @override
  State<NavigationButton> createState() => _CategoryButtonState();
}

class _CategoryButtonState extends State<NavigationButton> {
  late String button;

  @override
  void initState() {
    button = "assets/images/pressed_btn.svg";
    super.initState();
    size = false;
  }

  bool size = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => setState(() {
        button = "assets/images/pressed_btn.svg";
        size = true;
      }),
      onExit: (event) => setState(() {
        button = "assets/images/pressed_btn.svg";
        size = false;
      }),
      child: InkWell(
        onTap: widget.onTap,
        child: Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset(
              button,
              height: size ? 77.h : null,
            ),

            // Centered text
            Padding(
                padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 10.w),
                child: LinearColor(
                  widget: Text(widget.text,
                      style: MyTextStyle.textStyle18.copyWith(
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
    );
  }
}
