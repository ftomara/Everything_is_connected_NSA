import 'package:everything_is_connected_app/core/utils/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:gradient_borders/input_borders/gradient_outline_input_border.dart';

// ignore: must_be_immutable
class Answerbtn extends StatefulWidget {
  Answerbtn({super.key, required this.text , this.ontap, required bool isCorrect, required bool isSelected});
  String text = '';
  final Function()? ontap;

  @override
  State<Answerbtn> createState() => _AnswerbtnState();
}

class _AnswerbtnState extends State<Answerbtn> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.ontap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
        decoration: BoxDecoration(
          border: GradientBoxBorder(
            gradient: LinearGradient(
              colors: [Color(0xFFE8DBC3), Color(0xFFDFAB46)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        child: Center(
          child: Text(widget.text,style: MyTextStyle.textStyle12.copyWith(fontSize: 16),
          textAlign: TextAlign.left,),
        ),
      ),
    );
  }
}
