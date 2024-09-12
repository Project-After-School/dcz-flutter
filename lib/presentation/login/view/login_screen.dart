import 'package:dcz/core/component/widget/dcz_button.dart';
import 'package:dcz/core/component/widget/dcz_textfield.dart';
import 'package:dcz/core/dcz.dart';
import 'package:dcz/presentation/login/widget/login_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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

  @override
  void initState() {
    super.initState();
    idController = TextEditingController();
    pwdController = TextEditingController();
    idFocusNode = FocusNode();
    pwdFocusNode = FocusNode();
    idController.addListener(_checkFields);
    pwdController.addListener(_checkFields);
  }

  void _checkFields() {
    setState(() {
      areAllFieldsFilled = idController.text.isNotEmpty && pwdController.text.isNotEmpty;
    });
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
                const Spacer(),
                GestureDetector(
                  child: DczButton(
                    backgroundColor: areAllFieldsFilled ? DCZColor.main500 : DCZColor.main100,
                    color: DCZColor.black,
                    text: '로그인하기',
                  ),
                  onTap: (){context.push('/navigation');},
                )
              ],
            ),
          )
      ),
    );
  }
}