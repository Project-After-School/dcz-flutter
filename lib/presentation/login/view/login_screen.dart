import 'package:dcz/data/data_sources/remote/login_remote_data_source.dart';
import 'package:dcz/data/data_sources/secure_storage_data_source.dart';
import 'package:dcz/presentation/login/widget/login_title_widget.dart';
import 'package:dcz/core/component/widget/dcz_textfield.dart';
import 'package:dcz/core/component/widget/dcz_button.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:dcz/core/dcz.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {

  late TextEditingController idController;
  late TextEditingController pwdController;
  late FocusNode idFocusNode;
  late FocusNode pwdFocusNode;
  bool areAllFieldsFilled = false;
  bool isLoading = false;
  String? errorMessage;

  final AuthRepository authRepository = AuthRepository();
  String? userInfo;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkLoginStatus();
    });
    idController = TextEditingController();
    pwdController = TextEditingController();
    idFocusNode = FocusNode();
    pwdFocusNode = FocusNode();
    idController.addListener(_checkFields);
    pwdController.addListener(_checkFields);
  }

  Future<void> _checkLoginStatus() async {
    userInfo = await authRepository.getToken();

    if (userInfo != null) {
      context.push('/navigation');
    } else {
      print('로그인 하세요');
    }
  }

  void _checkFields() {
    setState(() {
      areAllFieldsFilled = idController.text.isNotEmpty && pwdController.text.isNotEmpty;
    });
  }

  Future<void> _handleLogin() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      String token = await postLoginInfo(idController.text, pwdController.text);
      await authRepository.saveToken(token);
      context.push('/navigation');
    } catch (e) {
      setState(() {
        errorMessage = '다시 확인해주세요.';
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    idController.dispose();
    pwdController.dispose();
    idFocusNode.dispose();
    pwdFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DCZColor.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LoginTitleWidget(),
              const SizedBox(height: 32),
              Column(
                children: [
                  DczTextfield(
                    controller: idController,
                    focusNode: idFocusNode,
                    title: '아이디',
                    widgetTitle: '아이디를 입력해주세요',
                  ),
                  const SizedBox(height: 32),
                  DczTextfield(
                    controller: pwdController,
                    focusNode: pwdFocusNode,
                    title: '비밀번호',
                    type: DCZTextFieldType.password,
                    widgetTitle: '비밀번호를 입력해주세요',
                  ),
                ],
              ),
              if (errorMessage != null)
                Padding(
                  padding: const EdgeInsets.only(top: 12, left: 230),
                  child: Text(
                    errorMessage!,
                    style: TextStyle(color: DCZColor.red),
                  ),
                ),
              const Spacer(),
              GestureDetector(
                onTap: (areAllFieldsFilled && !isLoading) ? _handleLogin : null,
                child: DczButton(
                  backgroundColor: areAllFieldsFilled ? DCZColor.main500 : DCZColor.main100,
                  color: DCZColor.black,
                  text: '로그인하기',
                ),
              ),
              const SizedBox(height: 32)
            ],
          ),
        ),
      ),
    );
  }
}
