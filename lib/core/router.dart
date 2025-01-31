import 'package:dcz/core/view/splash_screen.dart';
import 'package:dcz/presentation/%20homework/view/homework_screen.dart';
import 'package:dcz/presentation/homework_detail/view/homework_detail_screen.dart';
import 'package:dcz/presentation/login/view/login_screen.dart';
import 'package:dcz/presentation/main/view/main_screen.dart';
import 'package:dcz/presentation/main_detail/view/main_detail_screen.dart';
import 'package:dcz/presentation/my_page/view/my_page_screen.dart';
import 'package:dcz/presentation/navigation/widget/navigation_widget.dart';
import 'package:dcz/presentation/notification/view/notification_screen.dart';
import 'package:dcz/presentation/notification_detail/view/notification_detail_screen.dart';
import 'package:dcz/presentation/on_boarding/view/on_boarding_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen()
    ),
    GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnBoardingScreen()
    ),
    GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen()
    ),
    GoRoute(
        path: '/mypage',
        builder: (context, state) => const MyPageScreen()
    ),
    GoRoute(
        path: '/main',
        builder: (context, state) => const MainScreen()
    ),
    GoRoute(
        path: '/main_detail',
        builder: (context, state) => const MainDetailScreen()
    ),
      GoRoute(
          path: '/notification_detail',
          builder: (context, state) {
              final notificationId = state.extra as String;
              return NotificationDetailScreen(notificationId: notificationId);
          },
      ),
    GoRoute(
        path: '/notification',
        builder: (context, state) => const NotificationScreen()
    ),
    GoRoute(
        path: '/homework',
        builder: (context, state) => const HomeworkScreen()
    ),
    GoRoute(
        path: '/homework_detail',
        builder: (context, state) => const HomeworkDetailScreen()
    ),
    GoRoute(
        path: '/navigation',
        builder: (context, state) => const NavigationWidget()
    )
  ]
);