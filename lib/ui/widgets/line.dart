import 'package:everything_is_connected_app/core/utils/common_widgets/line_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Line extends StatelessWidget {
  final Offset start;
  final Offset end;
  const Line({super.key, required this.end, required this.start});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 1.h,
      left: 1.w,
      child: CustomPaint(
        size: Size(200, 200),
        painter: LinePainter(
          start: start,

          end: end,
          color: Color(0xFFE3C17D),
          width: 2, // Line width
        ),
      ),
    );
  }
}
