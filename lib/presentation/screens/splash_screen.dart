import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sport_circle/core/di/injection.dart';
import 'package:sport_circle/core/presentation/widgets/sport_circle_loading.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigate();
  }

  Future<void> _navigate() async {
    // Tampilkan splash minimal 2 detik
    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;

    // Cek apakah user sudah login (ada token tersimpan)
    final prefs = getIt<SharedPreferences>();
    final token = prefs.getString('token');

    if (token != null && token.isNotEmpty) {
      context.go('/home');
    } else {
      context.go('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: SportCircleLoading(isOverlay: false)),
    );
  }
}
