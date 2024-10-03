import 'package:everything_is_connected_app/constant.dart';
import 'package:everything_is_connected_app/core/utils/my_text_style.dart';
import 'package:flutter/material.dart';

void systemDialogue(String title, String message, BuildContext context) {
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
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              SizedBox(height: 16),
              SingleChildScrollView(
                child: SelectableText(
                  message,
                  style: TextStyle(color: Colors.white),
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
