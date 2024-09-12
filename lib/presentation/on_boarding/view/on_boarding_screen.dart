import 'package:dcz/core/dcz.dart';
import 'package:dcz/presentation/on_boarding/widget/on_boarding_button_widget.dart';
import 'package:dcz/presentation/on_boarding/widget/on_boarding_logo_widget.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DCZColor.background,
      body: Column(
        children: [
          const SizedBox(height: 368,),
          OnBoardingLogoWidget(),
          Spacer(),
          Container(
            width: 390,
            height: 1,
            decoration: BoxDecoration(color: DCZColor.gray800),
          ),
          OnBoardingButtonWidget(),
          const SizedBox(height: 32)
        ],
      ),
    );
  }
}
