import 'package:everything_is_connected_app/screens/info_screen.dart';
import 'package:flutter/material.dart';

class ExploreInfoScreen extends StatefulWidget {
  const ExploreInfoScreen({super.key});

  @override
  State<ExploreInfoScreen> createState() => _ExploreInfoScreenState();
}

class _ExploreInfoScreenState extends State<ExploreInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return InfoScreen(close: true, arrow: true, list: [
       
    ]);
  }
}
