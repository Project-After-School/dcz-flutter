import 'package:dcz/core/dcz.dart';
import 'package:dcz/data/data_sources/remote/notification/notification_comment_get.dart';
import 'package:dcz/data/data_sources/remote/notification/notification_comment_user.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class NotificationDetailQnaWidget extends StatefulWidget {
  final String notificationId;

  const NotificationDetailQnaWidget({required this.notificationId, super.key});

  @override
  State<NotificationDetailQnaWidget> createState() => _NotificationDetailQnaWidgetState();
}

class _NotificationDetailQnaWidgetState extends State<NotificationDetailQnaWidget> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _comments = [];

  @override
  void initState() {
    super.initState();
    _fetchComments();
  }

  Future<void> _fetchComments() async {
    final comments = await getNotificationComments(widget.notificationId);
    setState(() {
      _comments.addAll(comments);
    });
  }

  void _sendMessage() async {
    if (_controller.text.isNotEmpty) {
      String content = _controller.text;

      final response = await postNotificationComment(widget.notificationId, content);

      if (response.isNotEmpty && response['status'] == 'success') {
        setState(() {
          _comments.add({'content': content, 'author': '나'});
          _controller.clear();
        });
      } else {
        print("${response['status']}");
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 416,
      decoration: BoxDecoration(
        color: DCZColor.background,
        border: Border.all(color: DCZColor.gray900, width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Q&A', style: DCZTextStyle.heading4(color: DCZColor.white)),
          const SizedBox(height: 8),
          Text('모든 사람이 볼 수 있습니다.', style: DCZTextStyle.body3(color: DCZColor.gray100)),
          const SizedBox(height: 12),
          Expanded(
            child: ListView.builder(
              itemCount: _comments.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: _buildCommentBubble(_comments[index]),
                );
              },
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 34,
                  padding: const EdgeInsets.only(left: 16, top: 10, bottom: 10),
                  decoration: BoxDecoration(
                    color: DCZColor.gray900,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: '질문을 입력해주세요.',
                      hintStyle: DCZTextStyle.caption3(color: DCZColor.gray600),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              GestureDetector(
                onTap: _sendMessage,
                child: SvgPicture.asset(
                  'assets/images/icon/notification_detail/send_icon.svg',
                  height: 24,
                  width: 24,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCommentBubble(Map<String, String> comment) {

    bool isCurrentUser = comment['author'] == '서예린';

    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: DCZColor.gray800,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!isCurrentUser)
              Text(
                comment['author'] ?? '알 수 없음',
                style: DCZTextStyle.caption3(color: DCZColor.white),
              ),
            const SizedBox(height: 4),
            Text(
              comment['content'] ?? '',
              style: DCZTextStyle.caption3(color: DCZColor.white),
            ),
          ],
        ),
      ),
    );
  }
}
