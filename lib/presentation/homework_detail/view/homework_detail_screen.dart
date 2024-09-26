import 'package:dcz/core/component/widget/dcz_button.dart';
import 'package:dcz/core/component/widget/dcz_toast_message.dart';
import 'package:dcz/core/dcz.dart';
import 'package:dcz/presentation/homework_detail/widget/homework_detail_app_bar_widget.dart';
import 'package:dcz/presentation/homework_detail/widget/homework_detail_my_feedback_widget.dart';
import 'package:dcz/presentation/homework_detail/widget/homework_detail_submit_file_widget.dart';
import 'package:dcz/presentation/homework_detail/widget/homework_detail_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeworkDetailScreen extends StatefulWidget {
  const HomeworkDetailScreen({super.key});

  @override
  State<HomeworkDetailScreen> createState() => _HomeworkDetailScreenState();
}

class _HomeworkDetailScreenState extends State<HomeworkDetailScreen> {

  // Future<bool> _attemptCancelSubmission() async {
  //   // 여기에 실제 제출 취소 로직을 구현합니다.
  //   // 지금은 임의로 80%의 확률로 성공하도록 설정했습니다.
  //   await Future.delayed(const Duration(seconds: 1)); // 네트워크 지연 시뮬레이션
  //   return DateTime.now().millisecond % 10 < 8; // 80% 확률로 true 반환
  // }
  //
  // void _handleCancelSubmission() async {
  //   bool success = await _attemptCancelSubmission();
  //
  //   if (success) {
  //     // 성공 시
  //     WidgetsBinding.instance.addPostFrameCallback((_) {
  //       showCustomToast(context, '과제 제출 취소가 완료되었습니다!');
  //     });
  //     context.pop();
  //   } else {
  //     // 실패 시
  //     showCustomToast(context, '과제 제출 취소에 실패했습니다. 다시 시도해주세요.');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeworkDetailAppBarWidget(),
      backgroundColor: DCZColor.background,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeworkDetailTitleWidget(),
                const SizedBox(height: 24),
                HomeworkDetailSubmitFileWidget(),
                const SizedBox(height: 40),
                HomeworkDetailMyFeedbackWidget()
              ],
            ),
          ),
          const Spacer(),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 1,
            decoration: BoxDecoration(
              color: DCZColor.gray800,
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 24),
            child: GestureDetector(
              onTap: () {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  showCustomToast(context, '과제 제출 취소가 완료되었습니다!');
                });
                context.pop();
              },
              child: DczButton(
                color: DCZColor.black,
                backgroundColor: DCZColor.main100,
                text: '제출 취소하기',
              ),
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}