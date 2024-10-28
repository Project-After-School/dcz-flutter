import 'package:dcz/core/component/widget/dcz_solve_subject.dart';
import 'package:dcz/core/component/widget/dcz_subject.dart';
import 'package:dcz/core/dcz.dart';
import 'package:dcz/presentation/main/widget/main_app_bar_widget.dart';
import 'package:dcz/presentation/main/widget/main_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBarWidget(),
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
                Padding(padding: const EdgeInsets.only(left: 24, top: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const MainTitleWidget(),
                      const SizedBox(height: 28),
                      SizedBox(
                        height: 100,
                        child: Scrollbar(
                          controller: _scrollController,
                          thumbVisibility: true,
                          thickness: 4,
                          radius: const Radius.circular(10),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            controller: _scrollController,
                            itemCount: 20,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 24),
                                child: DczSubject(
                                  subjectName: '수학',
                                  onTap: () {},
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(padding: const EdgeInsets.only(left: 24, right: 24, top: 16),
                  child: GestureDetector(
                    onTap: (){
                      context.push('/main_detail');
                    },
                    child: const Column(
                      children: [
                        DczSolveSubject(
                          solvesubjectName: '수학 포스터 만들어서 제출하기',
                          subjectName: '수학',
                          teacherName: '강해민',
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}
