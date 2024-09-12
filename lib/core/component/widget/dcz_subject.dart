import 'package:dcz/core/dcz.dart';
import 'package:flutter/material.dart';

class DczSubject extends StatefulWidget {
  final String subjectName;
  final VoidCallback onTap;

  const DczSubject({
    Key? key,
    required this.subjectName,
    required this.onTap,
  }) : super(key: key);

  @override
  State<DczSubject> createState() => _DczSubjectState();
}

class _DczSubjectState extends State<DczSubject> {
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: _focusNode,
      child: GestureDetector(
        onTap: () {
          widget.onTap();
          _focusNode.requestFocus();
        },
        child: Center(
          child: Column(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: DCZColor.white,
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: _isFocused ? DCZColor.main500: DCZColor.white,
                    width: 2,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                  widget.subjectName,
                  style: TextStyle(
                    color: _isFocused ? DCZColor.main500 : DCZColor.white,
                  ),
                ),
            ],
          ),
        ),
      )
    );
  }
}