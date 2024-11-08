import 'package:dcz/core/component/fonts/dcz_text_style.dart';
import 'package:dcz/core/dcz.dart';
import 'package:flutter/material.dart';

class MainDetailTitleWidget extends StatelessWidget {
  const MainDetailTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('수학 포스터 만들어서 제출하기', style: DCZTextStyle.heading4(color: DCZColor.white),),
        const SizedBox(height: 28),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text('수학', style: DCZTextStyle.body3(color: DCZColor.gray200),),
                const SizedBox(width: 8),
                Text('강해민 선생님', style: DCZTextStyle.body3(color: DCZColor.gray200),),
              ],
            ),
            Text('9월 20일 ~ 9월 30일', style: DCZTextStyle.body3(color: DCZColor.gray200),)
          ],
        )
      ],
    );
  }
}
