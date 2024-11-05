import 'package:dcz/core/dcz_color.dart';
import 'package:dcz/presentation/my_page/widget/my_page_account_widget.dart';
import 'package:dcz/presentation/my_page/widget/my_page_app_bar_widget.dart';
import 'package:dcz/presentation/my_page/widget/my_page_profile_widget.dart';
import 'package:dcz/presentation/my_page/widget/my_page_title_widget.dart';
import 'package:flutter/material.dart';

class MyPageScreen extends StatefulWidget {
  const MyPageScreen({super.key});

  @override
  State<MyPageScreen> createState() => _MyPageScreenState();
}

class _MyPageScreenState extends State<MyPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyPageAppBarWidget(),
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
                      MyPageTitleWidget(),
                      const SizedBox(height: 39),
                      MyPageAccountWidget()
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
