import 'package:dcz/core/dcz.dart';
import 'package:flutter/material.dart';

class MainTitleWidget extends StatelessWidget {
  const MainTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      '해결할 과제', style: DCZTextStyle.heading3(color: DCZColor.white),
    );
  }
}
