import 'package:dcz/core/dcz.dart';
import 'package:flutter/material.dart';

class HomeworkTitleWidget extends StatelessWidget {
  const HomeworkTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      '제출된 과제', style: DCZTextStyle.heading3(color: DCZColor.white),
    );
  }
}
