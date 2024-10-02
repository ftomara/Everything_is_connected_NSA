import 'package:everything_is_connected_app/core/utils/common_widgets/line_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimatedLine extends StatefulWidget {
  final Offset start;
  final Offset end;

  const AnimatedLine({super.key, required this.end, required this.start});

  @override
  State<AnimatedLine> createState() => __AnimatedLineState();
}

class __AnimatedLineState extends State<AnimatedLine>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1), // Set your desired duration
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);

    // Start the animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 1.h,
      left: 1.w,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          // Calculate the animated end position
          final animatedEnd = Offset(
            widget.start.dx +
                (widget.end.dx - widget.start.dx) * _animation.value,
            widget.start.dy +
                (widget.end.dy - widget.start.dy) * _animation.value,
          );

          return CustomPaint(
            size: Size(200, 200),
            painter: LinePainter(
              start: widget.start,
              end: animatedEnd,
              color: const Color(0xFFE3C17D),
              width: 2, // Line width
            ),
          );
        },
      ),
    );
  }
}
