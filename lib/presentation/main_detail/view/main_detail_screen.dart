import 'package:dcz/presentation/main_detail/widget/main_detail_app_bar_widget.dart';
import 'package:dcz/presentation/main_detail/widget/main_detail_explain_widget.dart';
import 'package:dcz/presentation/main_detail/widget/main_detail_file_widget.dart';
import 'package:dcz/presentation/main_detail/widget/main_detail_qna_widget.dart';
import 'package:dcz/presentation/main_detail/widget/main_detail_title_widget.dart';
import 'package:dcz/core/component/widget/dcz_toast_message.dart';
import 'package:dcz/core/component/widget/dcz_button.dart';
import 'package:flutter/material.dart';
import 'package:dcz/core/dcz.dart';

class MainDetailScreen extends StatefulWidget {
  const MainDetailScreen({super.key});

  @override
  State<MainDetailScreen> createState() => _MainDetailScreenState();
}

class _MainDetailScreenState extends State<MainDetailScreen> {
  bool isSubmitted = false;

  void toggleSubmission() {
    setState(() {
      isSubmitted = !isSubmitted;
    });
    if (isSubmitted) {
      showCustomToast(context, '과제 제출이 완료되었습니다!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainDetailAppBarWidget(),
      backgroundColor: DCZColor.background,
      body: Column(
        children: [
          const Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 24, right: 24, top: 40),
                child: Column(
                  children: [
                    MainDetailTitleWidget(),
                    const SizedBox(height: 20),
                    MainDetailExplainWidget(),
                    MainDetailFileWidget(),
                    const SizedBox(height: 32),
                    MainDetailQnaWidget(),
                    const SizedBox(height: 16,)
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 1,
            decoration: BoxDecoration(
                color: DCZColor.gray800
            ),
          ),
          GestureDetector(
            onTap: (){
              if (!isSubmitted) {
                showDialog(
                    barrierDismissible: true,
                    context: context,
                    builder: (BuildContext context) => Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor: DCZColor.background,
                      child: Container(
                        width: 330,
                        height: 300,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: DCZColor.gray900, width: 1)
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('과제 업로드', style: DCZTextStyle.subtitle2(color: DCZColor.white),),
                                GestureDetector(
                                  onTap: (){},
                                  child: Container(
                                      width: 77,
                                      height: 42,
                                      decoration: BoxDecoration(
                                          border: Border.all(color: DCZColor.main500, width: 1),
                                          borderRadius: BorderRadius.circular(12)
                                      ),
                                      child: Center(
                                        child: Text('파일 추가', style: DCZTextStyle.button3(color: DCZColor.main500),),
                                      )
                                  ),
                                )
                              ],
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                                toggleSubmission();
                              },
                              child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 42,
                                  decoration: BoxDecoration(
                                      color: DCZColor.main100,
                                      borderRadius: BorderRadius.circular(12)
                                  ),
                                  child: Center(
                                    child: Text('과제 제출하기', style: DCZTextStyle.button3(color: DCZColor.black),),
                                  )
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                );
              } else {
                toggleSubmission();
              }
            },
            child: Padding(
                padding: const EdgeInsets.only(left: 24, right: 24, bottom: 32, top: 16),
                child: DczButton(
                    backgroundColor: isSubmitted ? DCZColor.main100 : DCZColor.main500,
                    color: DCZColor.black,
                    text: isSubmitted ? '제출 취소하기' : '과제 제출하기'
                )
            ),
          )
        ],
      ),
    );
  }
}