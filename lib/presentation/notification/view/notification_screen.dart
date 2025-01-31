import 'package:dcz/core/component/fonts/dcz_text_style.dart';
import 'package:dcz/core/component/widget/dcz_notification.dart';
import 'package:dcz/core/component/widget/dcz_subject.dart';
import 'package:dcz/core/dcz_color.dart';
import 'package:dcz/presentation/notification/widget/notification_app_bar_widget.dart';
import 'package:dcz/presentation/notification/widget/notification_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:dcz/data/data_sources/remote/notification/notification_all_remote_data_source.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  late ScrollController _scrollController;
  late Future<List<Map<String, String>>> _notificationsFuture;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _notificationsFuture = fetchNotifications(0, 20);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  String formatDate(String dateStr) {

    DateTime notificationDate = DateTime.parse(dateStr);
    Duration difference = DateTime.now().difference(notificationDate);

    if (difference.inDays >= 1) {
      return '${difference.inDays}일 전';
    } else if (difference.inHours >= 1) {
      return '${difference.inHours}시간 전';
    } else if (difference.inMinutes >= 1) {
      return '${difference.inMinutes}분 전';
    } else {
      return '방금';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NotificationAppBarWidget(),
      backgroundColor: DCZColor.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border(top: BorderSide(color: DCZColor.gray800)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 24, right: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const NotificationTitleWidget(),
                    const SizedBox(height: 28),
                    SizedBox(
                      height: 100,
                      child: Scrollbar(
                        controller: _scrollController,
                        thumbVisibility: true,
                        thickness: 4,
                        radius: const Radius.circular(10),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          controller: _scrollController,
                          itemCount: 20,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 24),
                              child: DczSubject(
                                subjectName: '수학',
                                onTap: () {},
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      '수학',
                      style: DCZTextStyle.subtitle1(color: DCZColor.white),
                    ),
                    const SizedBox(height: 12),
                    FutureBuilder<List<Map<String, String>>>(
                      future: _notificationsFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(child: CircularProgressIndicator());
                        } else {
                          final notifications = snapshot.data!;
                          return Column(
                            children: notifications.map((notification) {
                              String id = notification['id'] ?? '';
                              String formattedDate = formatDate(notification['date'] ?? '');
                              return DczNotification(
                                notificationTitle: notification['title'] ?? '',
                                date: formattedDate,
                                state: '안 읽음',
                                id: id,
                              );
                            }).toList(),
                          );
                        }
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
