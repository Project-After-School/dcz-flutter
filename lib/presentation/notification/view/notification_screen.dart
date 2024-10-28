import 'package:dcz/core/component/fonts/dcz_text_style.dart';
import 'package:dcz/core/component/widget/dcz_notification.dart';
import 'package:dcz/core/component/widget/dcz_subject.dart';
import 'package:dcz/core/dcz_color.dart';
import 'package:dcz/presentation/notification/widget/notification_app_bar_widget.dart';
import 'package:dcz/presentation/notification/widget/notification_title_widget.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NotificationAppBarWidget(),
      backgroundColor: DCZColor.background,
      body: SafeArea(
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
                  Text('수학', style: DCZTextStyle.subtitle1(color: DCZColor.white),),
                  const SizedBox(height: 12),
                  const SingleChildScrollView(
                    child: Column(
                      children: [
                        DczNotification(
                          notificationTitle: '수학 수행평가 안내',
                          date: '1일 전',
                          state: '안 읽음',
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}