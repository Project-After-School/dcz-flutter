import 'package:dcz/core/dcz.dart';
import 'package:flutter/material.dart';

class NotificationDetailTextWidget extends StatefulWidget {

  const NotificationDetailTextWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<NotificationDetailTextWidget> createState() => _NotificationDetailTextWidgetState();
}

class _NotificationDetailTextWidgetState extends State<NotificationDetailTextWidget> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('content',
          style: DCZTextStyle.body3(color: DCZColor.gray50),
        ),

      ],
    );
  }
}
