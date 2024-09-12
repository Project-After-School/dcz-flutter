import 'package:dcz/core/dcz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeworkAppBarWidget extends StatelessWidget implements PreferredSizeWidget{
  const HomeworkAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: DCZColor.background,
      automaticallyImplyLeading: false,
      scrolledUnderElevation: 0,
      elevation: 0,
      //bottom: Border(bottom: BorderSide(color: DCZColor.gray800)),
      title: Row(
        children: [
          const SizedBox(width: 10),
          SvgPicture.asset('assets/images/logo/D-CZ_main.svg')
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
