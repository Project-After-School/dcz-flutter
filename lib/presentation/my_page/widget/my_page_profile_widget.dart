import 'package:dcz/core/dcz.dart';
import 'package:flutter/material.dart';
import 'package:dcz/presentation/my_page/widget/my_page_account_widget.dart';

class MyPageProfileWidget extends StatefulWidget {
  const MyPageProfileWidget({super.key});

  @override
  State<MyPageProfileWidget> createState() => _MyPageProfileWidgetState();
}

class _MyPageProfileWidgetState extends State<MyPageProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(width: 52, height: 52,
          decoration: BoxDecoration(
            color: DCZColor.gray900,
            borderRadius: BorderRadius.circular(100)
        ),),
        const SizedBox(width: 24),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('2학년 3반 1번', style: DCZTextStyle.body2(color: DCZColor.white),),
            const SizedBox(height: 12),
            Text('강해민', style: DCZTextStyle.body1(color: DCZColor.white),),
          ],
        )
      ],
    );
  }
}
