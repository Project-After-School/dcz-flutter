import 'package:dcz/core/dcz.dart';
import 'package:dcz/presentation/notification_detail/widget/notification_detail_app_bar_widget.dart';
import 'package:dcz/presentation/notification_detail/widget/notification_detail_qna_widget.dart';
import 'package:dcz/presentation/notification_detail/widget/notification_detail_text_widget.dart';
import 'package:dcz/presentation/notification_detail/widget/notification_detail_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotificationDetailScreen extends StatefulWidget {
  const NotificationDetailScreen({super.key});

  @override
  State<NotificationDetailScreen> createState() => _NotificationDetailScreenState();
}

class _NotificationDetailScreenState extends State<NotificationDetailScreen> {
  String formatDate(String? date) {
    if (date == null || date.isEmpty) {
      return '날짜 정보 없음';
    }

    try {
      DateTime parsedDate = DateTime.parse(date);
      return DateFormat('yyyy년 MM월 dd일').format(parsedDate);
    } catch (e) {
      return '날짜 정보 없음';
    }
  }


  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> notification = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: const NotificationDetailAppBarWidget(),
      backgroundColor: DCZColor.background,
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NotificationDetailTitleWidget(),
            const SizedBox(height: 30),
            NotificationDetailTextWidget(),
            const SizedBox(height: 72),
            const NotificationDetailQnaWidget(),
          ],
        ),
      ),
    );
  }
}
