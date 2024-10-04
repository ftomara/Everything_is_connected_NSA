import 'package:flutter/material.dart';

class Questionmodel {
  String question = '';
  String hint = '';
  late final int rightindx;
  List<String> answers = [];
  bool haslink = true;
  Offset? start;
  Offset? end;
  Questionmodel(this.question, this.answers, this.rightindx, this.hint,
      {this.haslink = true, this.start, this.end});
}
