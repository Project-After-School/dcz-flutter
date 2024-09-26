import 'package:dcz/core/component/widget/dcz_file.dart';
import 'package:dcz/core/dcz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DczSubmitSubject extends StatefulWidget {
  const DczSubmitSubject({super.key});

  @override
  State<DczSubmitSubject> createState() => _DczSubmitSubjectState();
}

class _DczSubmitSubjectState extends State<DczSubmitSubject> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: DCZColor.background,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: DCZColor.gray900, width: 1)
        ),
        padding: const EdgeInsets.only(left: 20, right: 20, top: 16, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('4일 전에 제출함', style: DCZTextStyle.body4(color: DCZColor.gray500),),
                Text('피드백 보기', style: DCZTextStyle.body4(color: DCZColor.gray100),)
              ],
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                SvgPicture.asset('assets/images/icon/solvesubject/subject_icon.svg'),
                const SizedBox(width: 8),
                Text('수학 포스터 만들어서 제출하기', style: DCZTextStyle.subtitle2(color: DCZColor.gray50),)
              ],
            ),
            const SizedBox(height: 14),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 0.5,
              decoration: BoxDecoration(
                color: DCZColor.gray900
              ),
            ),
            const SizedBox(height: 14),
            Text('내가 제출한 파일', style: DCZTextStyle.body4(color: DCZColor.gray400),),
            const SizedBox(height: 14),
            DczFile(
                fileTitle: '수학 파일 2301강해민.hwp'
            )
          ],
        ),
      ),
    );
  }
}
