import 'package:dcz/core/component/fonts/dcz_text_style.dart';
import 'package:dcz/core/dcz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DczFile extends StatefulWidget {

  final String fileTitle;
  
  const DczFile({
    required this.fileTitle,
    super.key});

  @override
  State<DczFile> createState() => _DczFileState();
}

class _DczFileState extends State<DczFile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 40,
        padding: const EdgeInsets.only(left: 11, right: 11, bottom: 8, top: 8),
        decoration: BoxDecoration(
          color: DCZColor.gray900,
          borderRadius: BorderRadius.circular(8)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
           children: [
             SvgPicture.asset('assets/images/icon/submitsubject/download_icon.svg'),
             const SizedBox(width: 12),
             Text(widget.fileTitle,
               style: DCZTextStyle.caption3(color: DCZColor.gray200),
             )
           ],
        ),
      ),
    );
  }
}
