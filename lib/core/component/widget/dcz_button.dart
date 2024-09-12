import 'package:flutter/material.dart';
import 'package:dcz/core/component/fonts/dcz_text_style.dart';

class DczButton extends StatelessWidget {

  final Color color;
  final String text;
  final Color? backgroundColor;

  const DczButton({
    super.key,
    required this.color,
    required this.text,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12)
      ),
      child: Center(
        child: Text(text, style: DCZTextStyle.button2(color: color),),
      ),
    );
  }
}
