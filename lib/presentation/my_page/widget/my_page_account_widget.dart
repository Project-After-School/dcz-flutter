import 'package:dcz/data/data_sources/secure_storage_data_source.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:dcz/core/dcz.dart';
import 'dart:io';

class MyPageAccountWidget extends StatefulWidget {
  const MyPageAccountWidget({super.key});

  @override
  State<MyPageAccountWidget> createState() => _MyPageAccountWidgetState();
}
class _MyPageAccountWidgetState extends State<MyPageAccountWidget> {
  final storage = const FlutterSecureStorage();
  File? _profileImage;

  final authRepository = AuthRepository();

  @override
  void initState() {
    super.initState();
    _loadProfileImage();
  }

  Future<void> _loadProfileImage() async {
    String? imagePath = await storage.read(key: 'profileImage');
    if (imagePath != null) {
      setState(() {
        _profileImage = File(imagePath);
      });
    }
  }

  Future<void> _handleLogout() async {

    await authRepository.deleteToken();

    String? tokenAfterLogout = await authRepository.getToken();
    print("Token after logout: $tokenAfterLogout");

    context.go('/onboarding');
  }



  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _profileImage = File(image.path);
      });
      await storage.write(key: 'profileImage', value: image.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: DCZColor.gray900,
                borderRadius: BorderRadius.circular(100),
                image: _profileImage != null
                    ? DecorationImage(
                  image: FileImage(_profileImage!),
                  fit: BoxFit.cover,
                ) : null,
              ),
            ),
            const SizedBox(width: 24),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('학년 반 번', style: DCZTextStyle.body2(color: DCZColor.white),),
                const SizedBox(height: 12),
                Text('강해민', style: DCZTextStyle.body1(color: DCZColor.white),),
              ],
            )
          ],
        ),
        const SizedBox(height: 64),
        Text('계정', style: DCZTextStyle.subtitle2(color: DCZColor.white)),
        const SizedBox(height: 48),
        GestureDetector(
          onTap: _pickImage,
          child: Row(
            children: [
              SvgPicture.asset('assets/images/icon/mypage/profile_edit_icon.svg'),
              const SizedBox(width: 20),
              Text('프로필 사진 변경', style: DCZTextStyle.subtitle2(color: DCZColor.white)),
            ],),),
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
                    border: Border.all(color: DCZColor.gray900, width: 0.5),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 24, bottom: 16),
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
                                ),),),],),),],),),),);},
          child: Row(
            children: [
              SvgPicture.asset('assets/images/icon/mypage/logout_icon.svg'),
              const SizedBox(width: 20),
              Text(
                '로그아웃',
                style: DCZTextStyle.subtitle2(color: DCZColor.white),),],),),],);}}