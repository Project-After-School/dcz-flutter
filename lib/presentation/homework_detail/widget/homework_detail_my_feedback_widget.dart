import 'package:dcz/core/component/fonts/dcz_text_style.dart';
import 'package:dcz/core/dcz.dart';
import 'package:flutter/material.dart';

class HomeworkDetailMyFeedbackWidget extends StatefulWidget {
  const HomeworkDetailMyFeedbackWidget({super.key});

  @override
  State<HomeworkDetailMyFeedbackWidget> createState() => _HomeworkDetailMyFeedbackWidgetState();
}

class _HomeworkDetailMyFeedbackWidgetState extends State<HomeworkDetailMyFeedbackWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '내가 받은 피드백',
          style: DCZTextStyle.heading4(color: DCZColor.white),
        ),
        const SizedBox(height: 24),
        Wrap(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: DCZColor.gray900,
              ),
              child: Text(
                'fjkda;kdsfj;f;djkladjkl;dㅁㄴㅇㄴㄹㄹㄴㄴㅇㄹㄹㅇㄴㄹㅇㄴㄹㅁㄴㅇㄹㅁㄴㅇㄹfasjlkfdasj;kdfaj;fjkda;kdsfj;f;djkladjkl;dfasjlkfdasj;kdfaj;klfdsljfjkda;kdsfj;f;djkladjkl;dfasjlkfdasj;kdfaj;klfdsljklfdsljk',
                style: DCZTextStyle.caption3(color: DCZColor.gray100),
                softWrap: true,
                overflow: TextOverflow.visible,
              ),
            ),
          ],
        ),
      ],
    );
  }
}