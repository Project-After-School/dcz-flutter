import 'package:dcz/core/component/fonts/dcz_text_style.dart';
import 'package:dcz/core/dcz.dart';
import 'package:flutter/material.dart';

class LoginTitleWidget extends StatelessWidget {
  const LoginTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('로그인하고', style: DCZTextStyle.heading3(color: DCZColor.white),),
          Text('D-CZ을 사용해보세요!', style: DCZTextStyle.heading3(color: DCZColor.white),),
          const SizedBox(height: 12),
          Text('스퀘어 계정으로 로그인 해주세요', style: DCZTextStyle.body3(color: DCZColor.gray200),)
        ],
      ),
    );
  }
}
