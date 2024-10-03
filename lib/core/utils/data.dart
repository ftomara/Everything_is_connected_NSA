import 'dart:convert';

import 'package:everything_is_connected_app/model/infomodel.dart';
import 'package:flutter/services.dart';

Future<List<Infomodel>> getAllEventInfo(int eventIndex) async {
  final String response =
      await rootBundle.loadString('assets/images/Data.json');
  final Map<String, dynamic> jsonData = json.decode(response);

  List<Infomodel> pages = [];

  // Ensure the eventIndex is within range
  if (eventIndex < jsonData['maps'].length) {
    var map = jsonData['maps'][eventIndex];
    var event = map['event'];

    // Loop through the 'info' list in the event
    for (int i = 0; i < event["info"].length; i++) {
      var imagePath = event["info"][i]['url']; // Get image path from the JSON
      List<String> content =
          List<String>.from(event["info"][i]['content']); // Extract content
      print(imagePath);
      // Create an Infomodel using the image path and the content
      pages.add(Infomodel(imagepath: imagePath, info: content));
    }
  } else {
    print("Event index out of range.");
  }

  return pages;
}
