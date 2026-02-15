import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sport_circle/core/di/injection.dart';
import 'package:sport_circle/core/presentation/widgets/sport_circle_loading.dart';
import 'package:sport_circle/core/storage/token_storage.dart';

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

    // Cek apakah user sudah login (ada token tersimpan secara aman)
    final tokenStorage = getIt<TokenStorage>();
    final hasToken = await tokenStorage.hasToken();

    if (hasToken) {
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
