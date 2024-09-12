import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:dcz/core/dcz.dart';

enum DCZTextFieldType{
  none,
  password
}

class DczTextfield extends StatefulWidget {

  final DCZTextFieldType type;
  final TextInputType textInputType;
  final TextEditingController controller;
  final FocusNode focusNode;
  final String title;

  final Function? onChanged;
  final Widget? suffix;
  final String? widgetTitle;

  const DczTextfield({
    super.key,
    this.type = DCZTextFieldType.none,
    this.textInputType = TextInputType.text,
    this.suffix,
    this.widgetTitle,
    this.onChanged,
    required this.controller,
    required this.focusNode,
    required this.title,
  });

  @override
  State<DczTextfield> createState() => _DczButtonState();
}

class _DczButtonState extends State<DczTextfield> {
  bool _isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: DCZTextStyle.label2(color: DCZColor.white),
        ),
        const SizedBox(height: 12),
        Container(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 44,
            decoration: BoxDecoration(
              color: DCZColor.gray900,
              borderRadius: BorderRadius.circular(8),
              border: widget.focusNode.hasFocus ? Border.all(
                color: DCZColor.main500,
                width: 1
              ) : null
            ),
            child: TextFormField(
              style: DCZTextStyle.caption3(color: DCZColor.white),
              controller: widget.controller,
              focusNode: widget.focusNode,
              cursorColor: DCZColor.main500,
              onChanged: (value) => widget.onChanged,
              keyboardType: widget.textInputType,
              obscureText: !_isClicked && widget.type == DCZTextFieldType.password,
              obscuringCharacter: "⦁",
              decoration: InputDecoration(
                hintText: widget.widgetTitle ?? widget.title,
                hintStyle: DCZTextStyle.caption3(color: DCZColor.gray600),
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                counterText: "",
                suffix: widget.suffix,
                suffixIcon: widget.type == DCZTextFieldType.password ? GestureDetector(
                  onTap: (){
                    setState(() {
                        _isClicked ? _isClicked = false : _isClicked = true;
                      });},
                  child: Padding(padding: const EdgeInsets.all(12),
                    child: SvgPicture.asset(_isClicked ?
                    "assets/images/icon/core/eyes_open_icon.svg" :
                    "assets/images/icon/core/eyes_close_icon.svg"
                    ),
                  ),
                ) : null
              ),
              onTap: (){
                FocusScope.of(context).hasFocus
                    ? FocusScope.of(context).unfocus()
                    : FocusScope.of(context).hasFocus;
              },
              onTapOutside: (event){
                FocusScope.of(context).unfocus();
              },
            ),
          ),
        )
      ],
    );
  }
}

