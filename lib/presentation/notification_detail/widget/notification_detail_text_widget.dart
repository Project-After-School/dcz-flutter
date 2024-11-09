import 'package:dcz/core/dcz.dart';
import 'package:flutter/material.dart';

class NotificationDetailTextWidget extends StatefulWidget {
  final String content;

  const NotificationDetailTextWidget({
    Key? key,
    required this.content,
  }) : super(key: key);

  @override
  State<NotificationDetailTextWidget> createState() => _NotificationDetailTextWidgetState();
}

class _NotificationDetailTextWidgetState extends State<NotificationDetailTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.content,
          style: DCZTextStyle.body3(color: DCZColor.gray50),
        ),
      ],
    );
  }
}
