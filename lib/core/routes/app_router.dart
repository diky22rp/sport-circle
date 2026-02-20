import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:sport_circle/features/authentication/presentation/pages/login_page.dart';
import 'package:sport_circle/features/authentication/presentation/pages/register_page.dart';
import 'package:sport_circle/features/home/presentation/home_screen.dart';
import 'package:sport_circle/features/main/presentation/main_page.dart';
import 'package:sport_circle/features/splash/splash_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
    GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterPage(),
    ),
    // Shell route untuk bottom bar
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainPage(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/home',
              builder: (context, state) => const HomeScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/profile',
              builder: (context, state) => const SplashScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/settings',
              builder: (context, state) => const HomeScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);
