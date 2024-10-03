import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown/markdown.dart' as md;

class AnimatedMarkdownText extends StatefulWidget {
  final String message;

  const AnimatedMarkdownText({super.key, required this.message});

  @override
  _AnimatedMarkdownTextState createState() => _AnimatedMarkdownTextState();
}

class _AnimatedMarkdownTextState extends State<AnimatedMarkdownText> {
  String _displayedText = "";
  int _currentIndex = 0;
  late final List<String> _messageParts;

  @override
  void initState() {
    super.initState();
    // Split the message into words or lines, depending on the animation style.
    _messageParts = widget.message.split(' ');
    _animateText();
  }

  Future<void> _animateText() async {
    for (var i = 0; i < _messageParts.length; i++) {
      setState(() {
        _displayedText += _messageParts[i] + ' ';
      });
      await Future.delayed(const Duration(milliseconds: 30)); 
    }
  }

  @override
  Widget build(BuildContext context) {
    return MarkdownBody(
      
      data: _displayedText,
      extensionSet: md.ExtensionSet(
        md.ExtensionSet.gitHubFlavored.blockSyntaxes,
        <md.InlineSyntax>[
          md.EmojiSyntax(),
          ...md.ExtensionSet.gitHubFlavored.inlineSyntaxes,
        ],
      ),
    );
  }
}
