import 'package:dcz/core/dcz_color.dart';
import 'package:dcz/presentation/%20homework/widget/homework_app_bar_widget.dart';
import 'package:dcz/presentation/%20homework/widget/homework_title_widget.dart';
import 'package:flutter/material.dart';

class HomeworkScreen extends StatefulWidget {
  const HomeworkScreen({super.key});

  @override
  State<HomeworkScreen> createState() => _HomeworkScreenState();
}

class _HomeworkScreenState extends State<HomeworkScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeworkAppBarWidget(),
      backgroundColor: DCZColor.background,
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border(top: BorderSide(color: DCZColor.gray800))
                  ),
                ),
                Padding(padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HomeworkTitleWidget()
                    ],
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}
