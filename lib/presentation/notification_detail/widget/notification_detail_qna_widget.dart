import 'package:dcz/core/dcz.dart';
import 'package:flutter/material.dart';

class NotificationDetailQnaWidget extends StatefulWidget {
  const NotificationDetailQnaWidget({super.key});

  @override
  State<NotificationDetailQnaWidget> createState() => _NotificationDetailQnaWidgetState();
}

class _NotificationDetailQnaWidgetState extends State<NotificationDetailQnaWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 416,
      decoration: BoxDecoration(
          color: DCZColor.background,
          border: Border.all(color: DCZColor.gray900, width: 1),
          borderRadius: BorderRadius.circular(12)
      ),
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Q&A', style: DCZTextStyle.heading4(color: DCZColor.white),),
          const SizedBox(height: 8),
          Text('모든 사람이 볼 수 있습니다.', style: DCZTextStyle.body3(color: DCZColor.gray100),)
        ],
      ),
    );
  }
}
