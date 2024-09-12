import 'package:dcz/core/component/widget/dcz_button.dart';
import 'package:dcz/core/dcz.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnBoardingButtonWidget extends StatelessWidget {
  const OnBoardingButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24),
      child: Column(
        children: [
          const SizedBox(height: 16),
          GestureDetector(
            onTap: (){
              context.push('/login');
            },
            child: DczButton(
              backgroundColor: DCZColor.main500,
              color: DCZColor.black,
              text: '로그인하기',
            ),
          )
        ],
      )
    );
  }
}
