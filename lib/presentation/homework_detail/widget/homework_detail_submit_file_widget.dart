import 'package:dcz/core/component/fonts/dcz_text_style.dart';
import 'package:dcz/core/component/widget/dcz_file.dart';
import 'package:dcz/core/dcz.dart';
import 'package:flutter/material.dart';

class HomeworkDetailSubmitFileWidget extends StatefulWidget {
  const HomeworkDetailSubmitFileWidget({super.key});

  @override
  State<HomeworkDetailSubmitFileWidget> createState() => _HomeworkDetailSubmitFileWidgetState();
}

class _HomeworkDetailSubmitFileWidgetState extends State<HomeworkDetailSubmitFileWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('내가 제출한 파일', style: DCZTextStyle.body3(color: DCZColor.gray400),),
        const SizedBox(height: 9),
        DczFile(fileTitle: '수학 파일 2301 강해민.hwp')
      ],
    );
  }
}
