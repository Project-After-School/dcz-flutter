import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dcz/core/dcz.dart';

class CustomToastMessage extends StatelessWidget {
  final String message;

  const CustomToastMessage({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: DCZColor.gray900,
        borderRadius: BorderRadius.circular(26),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset('assets/images/icon/core/success_icon.svg'),
          const SizedBox(width: 8),
          Text(
            message,
            style: DCZTextStyle.label3(color: DCZColor.gray50).copyWith(
              decoration: TextDecoration.none,
            ),
          ),
        ],
      ),
    );
  }
}

void showCustomToast(BuildContext context, String message) {
  final overlay = Overlay.of(context);
  final entry = OverlayEntry(
    builder: (context) => Positioned(
      bottom: 148,
      width: MediaQuery.of(context).size.width,
      child: Center(child: CustomToastMessage(message: message)),
    ),
  );

  overlay.insert(entry);
  Future.delayed(const Duration(seconds: 2), entry.remove);
}