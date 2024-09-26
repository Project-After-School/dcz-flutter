import 'package:dcz/core/component/fonts/dcz_text_style.dart';
import 'package:dcz/core/dcz.dart';
import 'package:flutter/material.dart';

class MainDetailQnaWidget extends StatefulWidget {
  const MainDetailQnaWidget({super.key});

  @override
  State<MainDetailQnaWidget> createState() => _MainDetailQnaWidgetState();
}

class _MainDetailQnaWidgetState extends State<MainDetailQnaWidget> {
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
          Text('작성자와 관리자만 열람 가능합니다.', style: DCZTextStyle.body3(color: DCZColor.gray100),)
        ],
      ),
    );
  }
}
