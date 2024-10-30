import 'package:dcz/core/dcz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Q&A', style: DCZTextStyle.heading4(color: DCZColor.white),),
          const SizedBox(height: 8),
          Text('모든 사람이 볼 수 있습니다.', style: DCZTextStyle.body3(color: DCZColor.gray100),),
          const Spacer(),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 34,
                  padding: const EdgeInsets.only(left: 16, top: 10, bottom: 10),
                  decoration: BoxDecoration(
                      color: DCZColor.gray900,
                      borderRadius: BorderRadius.circular(8)
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: '질문을 입력해주세요.',
                        hintStyle: DCZTextStyle.caption3(color: DCZColor.gray600),
                        border: InputBorder.none
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              GestureDetector(
                onTap: (){},
                child: SvgPicture.asset(
                  'assets/images/icon/notification_detail/send_icon.svg',
                  height: 24,
                  width: 24,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
