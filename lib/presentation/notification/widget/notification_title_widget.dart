import 'package:dcz/core/dcz.dart';
import 'package:flutter/material.dart';

class NotificationTitleWidget extends StatelessWidget {
  const NotificationTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      '공지사항', style: DCZTextStyle.heading3(color: DCZColor.white),
    );
  }
}
