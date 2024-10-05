import 'package:flutter/material.dart';

class Questionmodel {
  String question = '';
  String hint = '';
  late final int rightindx;
  List<String> answers = [];
  bool haslink = true;
  List<Map<Offset, Offset>?>?list = [];
  // Offset? start;
  // Offset? end;
  Questionmodel(this.question, this.answers, this.rightindx, this.hint,
      {this.haslink = true, this.list});


 

  // Factory constructor to create a Questionmodel from a JSON-like Map
//   factory Questionmodel.fromJson(Map<String, dynamic> json) {
//     return Questionmodel(
//       json['question'] ?? '', // Provide a default empty string if null
//       List<String>.from(json['answers'] ?? []), // Ensure it's a list of strings
//       json['rightindx'] ?? 0, // Default to 0 if right index is null
//       json['hint'] ?? '', // Provide a default empty string if hint is null
//       haslink: json['haslink'] ?? true, // Default true for `haslink`
//       start: json['startPosition'] != null
//           ? Offset(json['startPosition']['x'], json['startPosition']['y'])
//           : null, // Parse start offset if not null
//       end: json['endPosition'] != null
//           ? Offset(json['endPosition']['x'], json['endPosition']['y'])
//           : null, // Parse end offset if not null
//     );
//   }
}

  
