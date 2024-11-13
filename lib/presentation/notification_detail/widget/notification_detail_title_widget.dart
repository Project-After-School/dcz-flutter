import 'package:dcz/core/dcz.dart';
import 'package:flutter/material.dart';

class NotificationDetailTitleWidget extends StatefulWidget {
  final String title;
  final String authorName;
  final String date;

  const NotificationDetailTitleWidget({
    Key? key,
    required this.title,
    required this.authorName,
    required this.date,
  }) : super(key: key);

  @override
  State<NotificationDetailTitleWidget> createState() => _NotificationDetailTitleWidgetState();
}

class _NotificationDetailTitleWidgetState extends State<NotificationDetailTitleWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: DCZTextStyle.heading4(color: DCZColor.white),
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('${widget.authorName} 선생님', style: DCZTextStyle.caption3(color: DCZColor.gray600)),
            Text('${widget.date}', style: DCZTextStyle.caption3(color: DCZColor.gray600)),
          ],
        ),
      ],
    );
  }
}
