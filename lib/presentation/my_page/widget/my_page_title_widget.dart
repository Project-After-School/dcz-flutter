import 'package:dcz/core/component/fonts/dcz_text_style.dart';
import 'package:dcz/core/dcz.dart';
import 'package:flutter/material.dart';

class MyPageTitleWidget extends StatelessWidget {
  const MyPageTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      '마이페이지', style: DCZTextStyle.heading3(color: DCZColor.white),
    );
  }
}
