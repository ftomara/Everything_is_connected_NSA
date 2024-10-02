import 'package:everything_is_connected_app/core/utils/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BlueButton extends StatefulWidget {
  const BlueButton({super.key, required this.text, required this.ontap});
  final String text;
  final Function()? ontap;
  @override
  State<BlueButton> createState() => _BlueButtonState();
}

class _BlueButtonState extends State<BlueButton> {
  late String border;

  @override
  void initState() {
    border = "assets/images/HexTech_Blue.svg";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => setState(() {
        border = "assets/images/HexTech_Blue2.svg";
      }),
      onExit: (event) => setState(() {
        border = "assets/images/HexTech_Blue.svg";
      }),
      child: InkWell(
        onTap: widget.ontap,
        child: SizedBox(
          width: 68.w,
          height: 68.h,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(
                border,
                width: 288.w,
                height: 68.h,
                fit: BoxFit.fill,
              ),

              // Centered text
              Padding(
                padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 10.w),
                child: Text(widget.text, style: MyTextStyle.textStyle30),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
