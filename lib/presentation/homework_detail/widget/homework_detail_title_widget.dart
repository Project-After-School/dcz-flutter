import 'package:dcz/core/component/fonts/dcz_text_style.dart';
import 'package:dcz/core/dcz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeworkDetailTitleWidget extends StatefulWidget {
  const HomeworkDetailTitleWidget({super.key});

  @override
  State<HomeworkDetailTitleWidget> createState() => _HomeworkDetailTitleWidgetState();
}

class _HomeworkDetailTitleWidgetState extends State<HomeworkDetailTitleWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset('assets/images/icon/solvesubject/subject_icon.svg'),
        const SizedBox(width: 8),
        Text('수학 포스터 만들어서 제출하기', style: DCZTextStyle.subtitle1(color: DCZColor.gray50),)
      ],
    );
  }
}
