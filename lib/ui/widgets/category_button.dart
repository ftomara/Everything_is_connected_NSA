import 'package:everything_is_connected_app/core/utils/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CategoryButton extends StatefulWidget {
  const CategoryButton({super.key, required this.onTap, required this.text});
  final Function() onTap;
  final String text;
  @override
  State<CategoryButton> createState() => _CategoryButtonState();
}

class _CategoryButtonState extends State<CategoryButton> {
  late String button;

  @override
  void initState() {
    button = "assets/images/HexTech_Blue.svg";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => setState(() {
        button = "assets/images/HexTech_Blue2.svg";
      }),
      onExit: (event) => setState(() {
        button = "assets/images/HexTech_Blue.svg";
      }),
      child: InkWell(
        onTap: widget.onTap,
        child: Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset(
              button,
              width: 144.w,
              height: 34.h,
            ),

            // Centered text
            Padding(
              padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 10.w),
              child: Text(widget.text, style: MyTextStyle.textStyle15),
            ),
          ],
        ),
      ),
    );
  }
}
