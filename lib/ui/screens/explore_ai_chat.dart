import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:everything_is_connected_app/constant.dart';
import 'package:everything_is_connected_app/core/utils/common_widgets/background_image.dart';
import 'package:everything_is_connected_app/core/utils/common_widgets/linear_color.dart';
import 'package:everything_is_connected_app/core/utils/common_widgets/messagetile.dart';
import 'package:everything_is_connected_app/ui/screens/info_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:gradient_borders/input_borders/gradient_outline_input_border.dart';

class ExploreAiChat extends StatefulWidget {
  const ExploreAiChat({super.key});

  @override
  State<ExploreAiChat> createState() => _ExploreAiChatState();
}

class _ExploreAiChatState extends State<ExploreAiChat> {
  bool _aiThinking = false;
  bool _showThinkingAnimation = false;
  int? _thinkingMessageIndex;
  List<Content> history = [];
  AnimatedTextKit? _thinkingAnimation;
  late final GenerativeModel _model;
  late final ChatSession _chat;
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _textController = TextEditingController();
  final FocusNode _textFieldFocus = FocusNode();
  bool _loading = false;
  static const _apiKey = 'AIzaSyDjfsQOP3kSB8BF7-88iIUf8fqFkC8uNqg';
  void _scrollDown() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _scrollController.animateTo(
        _scrollController.position.minScrollExtent,
        duration: const Duration(
          milliseconds: 750,
        ),
        curve: Curves.easeOutCirc,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _model = GenerativeModel(
      model: 'gemini-pro',
      apiKey: _apiKey,
    );
    _chat = _model.startChat();
    _thinkingAnimation = AnimatedTextKit(
      animatedTexts: [
        TyperAnimatedText(
          "Thinking...",
          textStyle: TextStyle(
            fontSize: 16,
            color: defaultColor,
          ),
          speed: const Duration(milliseconds: 100),
        ),
      ],
      repeatForever: true,
    );
  }

  @override
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InfoScreen(
      ontap: () {},
      close: true,
      arrow: false,
      list: [
        Positioned(
          top: 100,
          left: 50,
          right: 50,
          bottom: 150,
          child: ListView.separated(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 90),
            itemCount: history.reversed.length,
            controller: _scrollController,
            reverse: true,
            itemBuilder: (context, index) {
              var content = history.reversed.toList()[index];
              var text = content.parts
                  .whereType<TextPart>()
                  .map<String>((e) => e.text)
                  .join('');

              bool isLastMessage = index == 0;

              if (_aiThinking && isLastMessage && _showThinkingAnimation) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset("assets/images/ai_avatar.svg"),
                    Flexible(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 13),
                        child: _thinkingAnimation, // Use single instance
                      ),
                    ),
                  ],
                );
              }

              return MessageTile(
                sendByMe: content.role == 'user',
                message: text,
                isLastMessage: isLastMessage,
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 15,
              );
            },
          ),
        ),
        Positioned(
          bottom: 24,
          left: 42,
          right: 42,
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    cursorColor: defaultColor,
                    autofocus: true,
                    focusNode: _textFieldFocus,
                    decoration: InputDecoration(
                      suffix: GestureDetector(
                        onTap: () {
                          setState(() {
                            history.add(Content(
                                'user', [TextPart(_textController.text)]));
                          });
                          _sendChatMessage(
                              _textController.text, history.length);
                        },
                        child: Container(
                          child: _loading
                              ? CircularProgressIndicator.adaptive(
                                  backgroundColor: Color(0xFFDFAB46),
                                )
                              : SvgPicture.asset("assets/images/send_icon.svg"),
                        ),
                      ),
                      border: GradientOutlineInputBorder(
                        gradient: LinearGradient(
                          colors: [Color(0xFFE8DBC3), Color(0xFFDFAB46)],
                        ),
                        width: 2,
                      ),
                      hintText: 'Write Your Message ...',
                      hintStyle: const TextStyle(
                          color: Color.fromARGB(20, 255, 255, 255)),
                      filled: true,
                      fillColor: Colors.transparent,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 15,
                      ),
                    ),
                    onSubmitted: (value) {
                      setState(() {
                        history.add(
                            Content('user', [TextPart(_textController.text)]));
                      });
                      _sendChatMessage(_textController.text, history.length);
                    },
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _sendChatMessage(String message, int historyIndex) async {
    setState(() {
      _textController.clear();
      _textFieldFocus.unfocus();
      _scrollDown();
    });
    if (_thinkingMessageIndex == null) {
      setState(() {
        _loading = true;
        _aiThinking = true;
        _showThinkingAnimation = true; // Start animation
        history.add(Content('model', [TextPart("thinking...")]));
        _thinkingMessageIndex =
            history.length - 1; // Track the index of the thinking message
      });
    }

    List<Part> parts = [];

    try {
      var response = _chat.sendMessageStream(Content.text(message));

      // Collect the full response
      await for (var item in response) {
        var text = item.text;

        if (text == null) {
          _showError('No response from API.');
          return;
        } else {
          parts.add(TextPart(text));
        }
      }

      // After collecting the full response, update the state
      setState(() {
        _loading = false;
        if (_thinkingMessageIndex != null &&
            _thinkingMessageIndex! < history.length) {
          history
              .removeAt(_thinkingMessageIndex!); // Remove the thinking message
          _thinkingMessageIndex = null;
        }

        history.add(Content('model', parts)); // Add the AI's full response
        _aiThinking = false; // Mark AI as not thinking anymore
      });
    } catch (e, t) {
      print(e);
      print(t);
      _showError(e.toString());
      setState(() {
        _loading = false;
        _aiThinking = false;
      });
    }
  }

  void _showError(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Something went wrong'),
          content: SingleChildScrollView(
            child: SelectableText(message),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            )
          ],
        );
      },
    );
  }
}
