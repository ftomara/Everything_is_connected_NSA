import 'package:flutter/material.dart';

class LinearColor extends StatelessWidget {
  const LinearColor({super.key, required this.widget});
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect rect) => LinearGradient(
        colors: [
          Color(0xff9F7D33),
          Color(0xffFFFDD1),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(rect),

      child: widget,

      // child: Text(
      //   "start",
      //   style: MyTextStyle.textStyle24.copyWith(
      //     shadows: <Shadow>[
      //       Shadow(
      //           offset: Offset(0, 0.5),
      //           blurRadius: 0.5,
      //           color: Colors.white.withOpacity(0.5)),
      //     ],
      //     color: Colors.white,
      //   ),
      // ),
    );
  }
}
