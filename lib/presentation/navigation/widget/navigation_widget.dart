import 'package:dcz/core/dcz.dart';
import 'package:dcz/presentation/%20homework/view/homework_screen.dart';
import 'package:dcz/presentation/main/view/main_screen.dart';
import 'package:dcz/presentation/my_page/view/my_page_screen.dart';
import 'package:dcz/presentation/notification/view/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavigationWidget extends StatefulWidget {
  const NavigationWidget({super.key});

  @override
  State<NavigationWidget> createState() => _NavigationWidgetState();
}

class _NavigationWidgetState extends State<NavigationWidget> {
  var _index = 0;
  final List<Widget> _pages = [
    const MainScreen(),
    const NotificationScreen(),
    const HomeworkScreen(),
    const MyPageScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_index],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border:Border(top: BorderSide(color: DCZColor.gray500))
        ),
        child: BottomNavigationBar(
          currentIndex: _index,
          onTap: (int index) {
            setState(() {
              _index = index;
            });
          },
          backgroundColor: DCZColor.background,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: DCZColor.main800,
          unselectedItemColor: DCZColor.gray500,
          selectedLabelStyle: DCZTextStyle.body4(color: DCZColor.main800),
          unselectedLabelStyle: DCZTextStyle.body4(color: DCZColor.gray500),
          items: [
            BottomNavigationBarItem(
              icon: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 12),
                  SvgPicture.asset(
                    'assets/images/icon/core/home_icon.svg',
                    color: _index == 0 ? DCZColor.main800 : DCZColor.gray500,
                  ),
                  const SizedBox(height: 4),
                ],
              ),
              label: '홈',
            ),
            BottomNavigationBarItem(
              icon: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 12),
                  SvgPicture.asset(
                    'assets/images/icon/core/notification_icon.svg',
                    color: _index == 1 ? DCZColor.main800 : DCZColor.gray500,
                  ),
                  const SizedBox(height: 4),
                ],
              ),
              label: '공지사항',
            ),
            BottomNavigationBarItem(
              icon: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 12),
                  SvgPicture.asset(
                    'assets/images/icon/core/homework_icon.svg',
                    color: _index == 2 ? DCZColor.main800 : DCZColor.gray500,
                  ),
                  const SizedBox(height: 4),
                ],
              ),
              label: '제출된 과제',
            ),
            BottomNavigationBarItem(
              icon: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 12),
                  SvgPicture.asset(
                    'assets/images/icon/core/my_page_icon.svg',
                    color: _index == 3 ? DCZColor.main800 : DCZColor.gray500,
                  ),
                  const SizedBox(height: 4),
                ],
              ),
              label: '마이페이지',
            ),
          ],
        ),
      ),
    );
  }
}