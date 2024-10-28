import 'package:dcz/core/dcz.dart';
import 'package:flutter/material.dart';

class NotificationDetailTitleWidget extends StatelessWidget {

  const NotificationDetailTitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('title', style: DCZTextStyle.heading4(color: DCZColor.white)),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('작성자: ', style: DCZTextStyle.caption3(color: DCZColor.gray600)),
            Text('날짜: ', style: DCZTextStyle.caption3(color: DCZColor.gray600)),
          ],
        )
      ],
    );
  }
}
