import 'package:flutter/material.dart';

class LinearColor extends StatelessWidget {
  const LinearColor({super.key, required this.widget});
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxHeight == 0 || constraints.maxWidth == 0) {
          // Return the widget as-is when the size is too small to avoid exceptions.
          return widget;
        }

        return ShaderMask(
          shaderCallback: (Rect rect) => LinearGradient(
            colors: [
              const Color(0xff9F7D33),
              const Color(0xffFFFDD1),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ).createShader(rect),
          child: widget,
        );
      },
    );
  }
}
