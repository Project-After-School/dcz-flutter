import 'package:dcz/core/dcz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class NotificationDetailAppBarWidget extends StatelessWidget implements PreferredSizeWidget{
  const NotificationDetailAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: DCZColor.background,
      automaticallyImplyLeading: false,
      scrolledUnderElevation: 0,
      elevation: 0,
        title: GestureDetector(
          onTap: (){
            context.pop();
          },
          child: Row(
            children: [
              SvgPicture.asset('assets/images/icon/submitsubject/back_icon.svg')
            ],
          ),
        )
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(40);
}
