import 'package:dcz/core/dcz.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DczNotification extends StatefulWidget {
  final String notificationTitle;
  final String date;
  final String state;

  const DczNotification({
    required this.notificationTitle,
    required this.date,
    required this.state,
    super.key,
  });

  @override
  State<DczNotification> createState() => _DczNotificationState();
}

class _DczNotificationState extends State<DczNotification> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            context.push('/notification_detail');
            widget.notificationTitle;
          },
          child: Container(
            color: DCZColor.background,
            child: Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.notificationTitle, style: DCZTextStyle.body2(color: DCZColor.white),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        widget.date, style: DCZTextStyle.body3(color: DCZColor.gray200),
                      ),
                    ],
                  ),
                  Text(
                    widget.state, style: DCZTextStyle.body4(color: DCZColor.main500),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
