import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:sport_circle/features/activity/domain/entities/activity_entity.dart';
import 'package:sport_circle/features/activity/presentation/pages/activity_detail_page.dart';
import 'package:sport_circle/features/activity/presentation/pages/activity_page.dart';
import 'package:sport_circle/features/authentication/presentation/pages/login_page.dart';
import 'package:sport_circle/features/authentication/presentation/pages/register_page.dart';
import 'package:sport_circle/features/like/presentation/pages/like_page.dart';
import 'package:sport_circle/features/main/presentation/main_page.dart';
import 'package:sport_circle/features/profile/presentation/profile_screen.dart';
import 'package:sport_circle/features/splash/presentation/splash_screen.dart';
import 'package:sport_circle/features/transaction/presentation/pages/my_transactions_page.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/register',
      name: 'register',
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
              path: '/activity',
              name: 'activity',
              builder: (context, state) => const ActivityPage(),
            ),
            GoRoute(
              path: '/activity/:id',
              name: 'activity_detail',
              builder: (context, state) {
                final activity = state.extra as ActivityEntity;
                return ActivityDetailPage(activity: activity);
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/saved',
              name: 'saved',
              builder: (context, state) => const LikePage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/history',
              name: 'history',
              builder: (context, state) => const MyTransactionsPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/profile',
              name: 'profile',
              builder: (context, state) => const ProfileScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);
