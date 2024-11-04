import 'package:dcz/core/dcz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';

class MyPageAccountWidget extends StatefulWidget {
  const MyPageAccountWidget({super.key});

  @override
  State<MyPageAccountWidget> createState() => _MyPageAccountWidgetState();
}

class _MyPageAccountWidgetState extends State<MyPageAccountWidget> {
  final storage = FlutterSecureStorage();

  Future<void> _handleLogout() async{
    await storage.delete(key: 'login');
    context.go('/login');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('계정', style: DCZTextStyle.subtitle2(color: DCZColor.white),),
        const SizedBox(height: 48),
        GestureDetector(
          onTap: (){

          },
          child: Row(
            children: [
              SvgPicture.asset('assets/images/icon/mypage/profile_edit_icon.svg'),
              const SizedBox(width: 20),
              Text('프로필 사진 변경', style: DCZTextStyle.subtitle2(color: DCZColor.white),)
            ],
          ),
        ),
        const SizedBox(height: 48),
        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) => Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor: DCZColor.background,
                child: Container(
                  width: 400,
                  height: 180,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: DCZColor.gray900, width: 0.5)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(padding: const EdgeInsets.only(left: 20, top: 24, bottom: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '정말 로그아웃 하시겠습니까?',
                              style: DCZTextStyle.body2(color: DCZColor.white),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              '기기내 계정에서 로그아웃 할 수 있어요',
                              style: DCZTextStyle.body4(color: DCZColor.gray200),
                            ),
                            Text(
                              '다음 이용 시에는 다시 로그인 해야 합니다.',
                              style: DCZTextStyle.body4(color: DCZColor.gray200),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(vertical: 8),
                                  backgroundColor: DCZColor.gray50,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  '취소',
                                  style: DCZTextStyle.button2(color: DCZColor.gray500),
                                ),
                              ),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(vertical: 8),
                                  backgroundColor: DCZColor.main500,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                onPressed: _handleLogout,
                                child: Text(
                                  '확인',
                                  style: DCZTextStyle.button2(color: DCZColor.black),
                                ),),),],),),],),),),);
          },
          child: Row(
            children: [
              SvgPicture.asset('assets/images/icon/mypage/logout_icon.svg'),
              const SizedBox(width: 20),
              Text(
                '로그아웃',
                style: DCZTextStyle.subtitle2(color: DCZColor.white),
              ),
            ],
          ),
        )
      ],
    );
  }
}
