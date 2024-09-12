import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingLogoWidget extends StatelessWidget {
  const OnBoardingLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset('assets/images/logo/splash_dcz_title.svg');
  }
}
