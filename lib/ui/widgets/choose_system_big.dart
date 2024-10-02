import 'package:everything_is_connected_app/ui/widgets/choose_system_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ChooseSystemBig extends StatelessWidget {
  const ChooseSystemBig({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Adjust the size of the frame
        SvgPicture.asset(
          "assets/images/image-frame.svg",
          width: 300.w, // Adjust width to make it bigger
          height: 300.h, // Adjust height to make it bigger
        ),
        // Position and scale the image
        Positioned(
          top: 5.h, // Adjust position as needed
          left: 5.w, // Adjust position as needed
          child: Image.asset(
            "assets/images/Screenshot 2024-09-20 at 10.17.01 PM 1.png",
            fit: BoxFit.fill,
            width: 280.w, // Scale width
            height: 280.h, // Scale height
          ),
        ),
        // Position and scale the star pin
        Positioned(
          top: -20.h, // Adjust position as needed
          left: 20.w,  // Adjust position as needed
          child: SvgPicture.asset(
            "assets/images/star_pin.svg",
            fit: BoxFit.cover,
            width: 50.w, // Adjust width to scale up or down
            height: 50.h, // Adjust height
          ),
        ),
        // Position and scale the button
        Positioned(
          top: 65.h, // Adjust as needed
          child: ChooseSystemButton(
            onTap: () {},
            text: "dddd",
            
          ),
        ),
      ],
    );
  
  }
}
