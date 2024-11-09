import 'package:dcz/core/dcz.dart';
import 'package:dcz/data/data_sources/remote/notification_detail_remote_data_source.dart';
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

  // 반환 타입을 Future<List<Map<String, String>>>로 수정
  Future<List<Map<String, String>>> fetchNotificationDetails() async {
    return getNotificationsDetail('someParameter');  // 'someParameter'에 적절한 값 전달
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NotificationDetailAppBarWidget(),
      backgroundColor: DCZColor.background,
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 32),
        child: FutureBuilder<List<Map<String, String>>>(
          future: fetchNotificationDetails(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No data available'));
            }
 
            var notificationDetail = snapshot.data![0];  // 첫 번째 항목 사용

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NotificationDetailTitleWidget(
                  title: notificationDetail['title'] ?? '제목 없음',
                  date: notificationDetail['date'] ?? '날짜 없음',
                  authorName: notificationDetail['author_name'] ?? '작성자 없음',
                ),
                const SizedBox(height: 30),
                NotificationDetailTextWidget(
                  content: notificationDetail['content'] ?? '내용 없음',
                ),
                const SizedBox(height: 72),
                const NotificationDetailQnaWidget(),
              ],
            );
          },
        ),
      ),
    );
  }
}