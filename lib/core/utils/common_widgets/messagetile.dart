import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:everything_is_connected_app/core/utils/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:url_launcher/url_launcher.dart';

// import '../../../constants/colors.dart';

class MessageTile extends StatelessWidget {
  const MessageTile({super.key, required this.sendByMe, required this.message});

  final bool sendByMe;
  final String message;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment:
          sendByMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        // Row(
        //   children: [
        //     // Text(
        //     //   sendByMe ? 'You' : '',
        //     //   style: const TextStyle(fontSize: 11.5, color: Colors.grey),
        //     // ),
        //   ]
        // ),
        // const SizedBox(
        //   height: 5,
        // ),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sendByMe == false
                ? SvgPicture.asset("assets/images/ai_avatar.svg")
                : const SizedBox.shrink(),
            Flexible(
              child: Container(
                // width: size.width / 1.3,
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 13),
                decoration: BoxDecoration(
                  color: sendByMe
                      ? Color.fromARGB(255, 14, 60, 80)
                      : Colors.transparent,
                ),
                child: MarkdownBody(
                  selectable: true,
                  data: message,
                  extensionSet: md.ExtensionSet(
                    md.ExtensionSet.gitHubFlavored.blockSyntaxes,
                    <md.InlineSyntax>[
                      md.EmojiSyntax(),
                      ...md.ExtensionSet.gitHubFlavored.inlineSyntaxes
                    ],
                  ),
                  onTapLink: (text, href, title) async {
                    await _launchUrl(text);
                  },
                ),
              ),
            ),
            // if (!sendByMe) ...[
              // const SizedBox(
              //   width: 8,
              // ),
              // IconButton(
              //     onPressed: () async {
              //       await Clipboard.setData(ClipboardData(
              //         text: message,
              //       ));
              //     },
              //     icon: Icon(
              //       Icons.file_copy_outlined,
              //       size: 20,
              //     )),
              // Icon(
              //   Icons.file_copy_outlined,
              //   color: Colors.grey.shade300,
              //   size: 20,
              // )
            // ]
          ],
        ),
      ],
    );
  }

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }
}
