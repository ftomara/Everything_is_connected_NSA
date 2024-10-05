// Function to parse the local JSON file into List<Questionmodel>
// import 'dart:convert';

// import 'package:everything_is_connected_app/model/questionmodel.dart';
// import 'package:flutter/services.dart';

// Future<List<Questionmodel>> parseQuestionsFromLocalJson() async {
//   // Load the JSON file from assets
//   String jsonString =
//       await rootBundle.loadString('assets/images/questions_extended.json');

//   // Decode the JSON string into a List of dynamic objects (maps)
//   List<dynamic> jsonList = jsonDecode(jsonString);

//   // Convert the list of maps into a list of Questionmodel objects
//   return jsonList
//       .where((json) => json['question'] != null) // Filter out null questions
//       .map<Questionmodel>((json) => Questionmodel.fromJson(json))
//       .toList();
// }
