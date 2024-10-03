import 'package:everything_is_connected_app/constant.dart';
import 'package:everything_is_connected_app/core/utils/my_text_style.dart';
import 'package:flutter/material.dart';

void showhint(String message, BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Color(0xFF0C384C),
        title: const Text('Hint'),
        content: SingleChildScrollView(
          child: SelectableText(message),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'OK',
              style: MyTextStyle.textStyle12
                  .copyWith(fontSize: 12, color: defaultColor),
            ),
          )
        ],
      );
    },
  );
}
