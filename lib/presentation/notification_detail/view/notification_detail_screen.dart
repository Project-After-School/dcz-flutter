import 'package:dcz/core/dcz.dart';
import 'package:dcz/data/data_sources/remote/notification/notification_detail_remote_data_source.dart';
import 'package:dcz/presentation/notification_detail/widget/notification_detail_app_bar_widget.dart';
import 'package:dcz/presentation/notification_detail/widget/notification_detail_qna_widget.dart';
import 'package:dcz/presentation/notification_detail/widget/notification_detail_text_widget.dart';
import 'package:dcz/presentation/notification_detail/widget/notification_detail_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotificationDetailScreen extends StatefulWidget {
  final String notificationId;

  const NotificationDetailScreen({required this.notificationId, super.key});

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

  Future<Map<String, String>> fetchNotificationDetails() async {
    final details = await getNotificationsDetail(widget.notificationId);
    return details;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NotificationDetailAppBarWidget(),
      backgroundColor: DCZColor.background,
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 32),
        child: FutureBuilder<Map<String, String>>(
          future: fetchNotificationDetails(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text("알림 정보가 없습니다."));
            } else {
              var notificationDetail = snapshot.data!;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NotificationDetailTitleWidget(
                    title: notificationDetail['title'] ?? '제목 없음',
                    date: formatDate(notificationDetail['date']),
                    authorName: notificationDetail['author_name'] ?? '작성자 없음',
                  ),
                  const SizedBox(height: 30),
                  NotificationDetailTextWidget(
                    content: notificationDetail['content'] ?? '내용 없음',
                  ),
                  const SizedBox(height: 72),
                  NotificationDetailQnaWidget(notificationId: widget.notificationId), // 알림 ID 전달
                ],
              );
            }
          },
        ),
      ),
    );
  }
}