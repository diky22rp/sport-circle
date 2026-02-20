import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sport_circle/core/utils/responsive_helper.dart';
import 'package:sport_circle/core/presentation/widgets/loading_indicator.dart';
import 'package:sport_circle/features/authentication/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:sport_circle/features/authentication/presentation/bloc/authentication/authentication_state.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    );
    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final responsive = ResponsiveHelper(context);
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) async {
        await Future.delayed(const Duration(seconds: 5));
        state.whenOrNull(
          authenticated: () => context.goNamed('home'),
          unauthenticated: () => context.goNamed('login'),
        );
      },
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF8FAFF), Color(0xFFE6ECF7)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo besar dengan shadow halus
              ScaleTransition(
                scale: _scaleAnimation,
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x14000000), // 8% black opacity
                          blurRadius: 32,
                          offset: const Offset(0, 16),
                        ),
                      ],
                    ),
                    child: Image.asset(
                      'assets/logo_transparent.png',
                      width: responsive.logoSize(
                        percent: 0.38,
                        min: 140,
                        max: 260,
                      ),
                      height: responsive.logoSize(
                        percent: 0.38,
                        min: 140,
                        max: 260,
                      ),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              SizedBox(height: responsive.verticalSpacing(0.018)),

              Text(
                'Olahraga. Komunitas. Terhubung.',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.primary,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w400,
                  fontSize: responsive.taglineFontSize(
                    percent: 0.032,
                    min: 11,
                    max: 16,
                  ),
                  letterSpacing: 0.5,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: responsive.verticalSpacing(0.045)),
              const LoadingIndicator(isOverlay: false),
            ],
          ),
        ),
      ),
    );
  }
}
