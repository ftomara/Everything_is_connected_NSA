import 'package:everything_is_connected_app/core/utils/common_widgets/background_image.dart';
import 'package:everything_is_connected_app/ui/widgets/blue_button.dart';

import 'package:everything_is_connected_app/ui/screens/explore_ai_chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundImage(
          child: Column(
        children: [
          SizedBox(
            height: 251.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 100.w,
              ),
              BlueButton(
                ontap: () {},
                text: "Cryosphere",
              ),
              SizedBox(
                width: 30.w,
              ),
              BlueButton(
                ontap: () {},
                text: "Biosphere",
              )
            ],
          ),
          SizedBox(
            height: 83.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 100.w,
              ),
              BlueButton(
                ontap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ExploreAiChat()));
                },
                text: "Atmosphere",
              ),
              SizedBox(
                width: 30.w,
              ),
              BlueButton(
                ontap: () {},
                text: "Geosphere",
              )
            ],
          ),
        ],
      )),
    );
  }
}
