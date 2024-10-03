import 'package:everything_is_connected_app/core/utils/common_widgets/animated_markdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:flutter_svg/svg.dart';

class MessageTile extends StatelessWidget {
  const MessageTile({
    super.key,
    required this.sendByMe,
    required this.message,
    required this.isLastMessage, // Add this flag to identify if it's the most recent message
  });

  final bool sendByMe;
  final String message;
  final bool isLastMessage; // New flag to track the latest message

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          sendByMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!sendByMe)
              SvgPicture.asset("assets/images/ai_avatar.svg"),
            Flexible(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 13),
                decoration: BoxDecoration(
                  color: sendByMe
                      ? const Color.fromARGB(255, 14, 60, 80)
                      : Colors.transparent,
                ),
                child: sendByMe
                    ? MarkdownBody(
                        selectable: true,
                        data: message,
                        extensionSet: md.ExtensionSet(
                          md.ExtensionSet.gitHubFlavored.blockSyntaxes,
                          <md.InlineSyntax>[
                            md.EmojiSyntax(),
                            ...md.ExtensionSet.gitHubFlavored.inlineSyntaxes,
                          ],
                        ),
                      )
                    : isLastMessage
                        ? AnimatedMarkdownText(message: message)  // Animate the last message
                        : MarkdownBody(                       // Display previous messages statically
                            data: message,
                            extensionSet: md.ExtensionSet(
                              md.ExtensionSet.gitHubFlavored.blockSyntaxes,
                              <md.InlineSyntax>[
                                md.EmojiSyntax(),
                                ...md.ExtensionSet.gitHubFlavored.inlineSyntaxes,
                              ],
                            ),
                          ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
