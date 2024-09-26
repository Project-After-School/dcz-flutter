import 'package:dcz/core/component/widget/dcz_file.dart';
import 'package:dcz/core/component/widget/dcz_toast_message.dart';
import 'package:dcz/core/dcz.dart';
import 'package:flutter/material.dart';

class MainDetailFileWidget extends StatefulWidget {
  const MainDetailFileWidget({super.key});

  @override
  State<MainDetailFileWidget> createState() => _MainDetailFileWidgetState();
}

class _MainDetailFileWidgetState extends State<MainDetailFileWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        showCustomToast(context, '양식 다운로드가 완료되었습니다.');
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Text('파일 양식', style: DCZTextStyle.subtitle2(color: DCZColor.white),),
          const SizedBox(height: 8),
          const DczFile(fileTitle: '수학 파일.hwp')
        ],
      ),
    );
  }
}
