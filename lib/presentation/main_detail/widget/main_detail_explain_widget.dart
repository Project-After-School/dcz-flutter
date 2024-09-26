import 'package:dcz/core/dcz.dart';
import 'package:flutter/material.dart';

class MainDetailExplainWidget extends StatefulWidget {
  const MainDetailExplainWidget({super.key});

  @override
  State<MainDetailExplainWidget> createState() => _MainDetailExplainWidgetState();
}

class _MainDetailExplainWidgetState extends State<MainDetailExplainWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 0.5,
          decoration: BoxDecoration(
            color: DCZColor.gray900
          ),
        ),
        const SizedBox(height: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('과제 설명', style: DCZTextStyle.subtitle2(color: DCZColor.white),),
            const SizedBox(height: 8),
            Text('한글 ㅁ누서로 11포인트로 해서 만ㄷ르어와 얘들아~한글 ㅁ누서로 11포인트로 해서 만ㄷ르어와 얘들아~', style: DCZTextStyle.caption3(color: DCZColor.gray200),),
            const SizedBox(height: 24),
            Text('제출 양식', style: DCZTextStyle.subtitle2(color: DCZColor.white),),
            const SizedBox(height: 8),
            Text('한글 ㅁ누서로 11포인트로 해서 만ㄷ르어와 얘들아~', style: DCZTextStyle.caption3(color: DCZColor.gray200),)
          ],
        ),
        const SizedBox(height: 24),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 0.5,
          decoration: BoxDecoration(
              color: DCZColor.gray900
          ),
        ),
      ],
    );
  }
}
