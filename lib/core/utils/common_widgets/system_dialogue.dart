import 'package:everything_is_connected_app/constant.dart';
import 'package:everything_is_connected_app/core/utils/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void systemDialogue(String title, String message, String image,BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        backgroundColor: Color(0xFF0C384C),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.5,
          padding: EdgeInsets.symmetric(vertical: 18, horizontal: 18),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  color: defaultColor,
                ),
              ),
              SizedBox(height: 16),
              SingleChildScrollView(
                child: Row(
                  children: [
                    Expanded(
                        child: Expanded(
                            child: Image.asset(
                      image,
                      width: 70.w,
                      height: 80.w,
                    ))),
                    SizedBox(
                      width: 5.w,
                    ),
                    Expanded(
                      child: SelectableText(
                        message,
                        style: TextStyle(color: defaultColor, fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'OK',
                    style: MyTextStyle.textStyle12.copyWith(
                      fontSize: 12,
                      color: defaultColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
