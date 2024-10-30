import 'package:dcz/core/dcz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DczSolveSubject extends StatelessWidget {

  final String solveSubjectName;
  final String subjectName;
  final String teacherName;
  final Color color;

  const DczSolveSubject({
    required this.solveSubjectName,
    required this.subjectName,
    required this.teacherName,
    required this.color,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(left: 20, right: 20, top: 16, bottom: 16),
      decoration: BoxDecoration(
        color: DCZColor.background,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('D-1', style: DCZTextStyle.subtitle2(color: color),),
              Text('기간이 하루 남았어요!', style: DCZTextStyle.body3(color: color),)
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: DCZColor.black,
                  borderRadius: BorderRadius.circular(22),
                  border: Border.all(color: color)
                ),
              ),
              const SizedBox(width: 12),
              Text(subjectName, style: DCZTextStyle.body2(color: DCZColor.gray200),),
              const SizedBox(width: 12),
              Text('$teacherName 선생님', style: DCZTextStyle.body2(color: DCZColor.gray200),)
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
          Row(
            children: [
              SvgPicture.asset('assets/images/icon/solvesubject/subject_icon.svg', color: color,),
              const SizedBox(width: 8),
              Text(solveSubjectName, style: DCZTextStyle.subtitle2(color: DCZColor.gray50),)
            ],
          )
        ],
      ),
    );
  }
}
