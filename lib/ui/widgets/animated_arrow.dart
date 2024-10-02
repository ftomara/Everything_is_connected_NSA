import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AnimatedArrow extends StatefulWidget {
  const AnimatedArrow({super.key, required this.ontap});

  @override
  State<AnimatedArrow> createState() => _AnimatedArrowState();

  final Function() ontap;
}

class _AnimatedArrowState extends State<AnimatedArrow>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: -10, end: 10).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(_animation.value, 0),
            child: InkWell(
              onTap: widget.ontap,
              child: SvgPicture.asset("assets/images/ArrowLeft&Right.svg"),
            ),
          );
        },
      ),
    );
  }
}
