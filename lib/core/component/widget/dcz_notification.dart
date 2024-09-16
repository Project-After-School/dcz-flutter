import 'package:flutter/material.dart';

class DczNotification extends StatefulWidget {

  final String notificationtitle;

  const DczNotification({super.key,
    required this.notificationtitle
  });

  @override
  State<DczNotification> createState() => _DczNotificationState();
}

class _DczNotificationState extends State<DczNotification> {



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Row(
        children: [

        ],
      ),
    );
  }
}
