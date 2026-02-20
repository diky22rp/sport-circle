import 'package:go_router/go_router.dart';
import 'package:sport_circle/features/authentication/presentation/pages/login_page.dart';
import 'package:sport_circle/features/authentication/presentation/pages/register_page.dart';
import 'package:sport_circle/presentation/screens/home_screen.dart';
import 'package:sport_circle/presentation/screens/splash_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
    GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
    GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterPage(),
    ),
  ],
);
