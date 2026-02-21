import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sport_circle/core/di/injection.dart';
import 'package:sport_circle/core/presentation/widgets/app_snackbar.dart';
import 'package:sport_circle/core/presentation/widgets/input_field.dart';
import 'package:sport_circle/core/utils/validators.dart';
import 'package:sport_circle/features/authentication/presentation/bloc/login/login_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<LoginBloc>(),
      child: const _LoginView(),
    );
  }
}

class _LoginView extends StatefulWidget {
  const _LoginView();

  @override
  State<_LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<_LoginView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String? _emailError;
  String? _passwordError;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (user) {
            if (!context.mounted) return;
            AppSnackbar.show(
              context,
              message: 'Welcome, ${user.name}!',
              type: AppSnackbarType.success,
            );

            context.goNamed('activity');
          },
          failure: (message) {
            AppSnackbar.show(
              context,
              message: message,
              type: AppSnackbarType.error,
            );
          },
        );
      },
      child: Scaffold(
        body: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            final theme = Theme.of(context);
            return Center(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 32,
                  ),
                  constraints: const BoxConstraints(maxWidth: 400),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 16,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Masuk Dulu, Biar Gak Ketinggalan!',
                        style: theme.textTheme.titleLarge?.copyWith(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Isi email & password, langsung gas!',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.secondary,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 32),
                      InputField(
                        label: 'Email',
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        errorText: _emailError,
                        isMandatory: true,
                        icon: Icons.email,
                      ),
                      const SizedBox(height: 16),
                      InputField(
                        label: 'Password',
                        controller: _passwordController,
                        isPassword: true,
                        errorText: _passwordError,
                        isMandatory: true,
                        icon: Icons.lock,
                      ),
                      const SizedBox(height: 24),
                      if (state.maybeWhen(
                        loading: () => true,
                        orElse: () => false,
                      ))
                        const Center(child: CircularProgressIndicator())
                      else
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            key: const Key('loginButton'),
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              backgroundColor: theme.colorScheme.primary,
                              foregroundColor: Colors.white,
                              textStyle: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                _emailError =
                                    Validators.validateNotEmpty(
                                      _emailController.text,
                                      'Email',
                                    ) ??
                                    Validators.validateEmail(
                                      _emailController.text,
                                    );
                                _passwordError = Validators.validateNotEmpty(
                                  _passwordController.text,
                                  'Password',
                                );
                              });
                              final errorMsg = _emailError ?? _passwordError;
                              if (errorMsg != null) {
                                AppSnackbar.show(
                                  context,
                                  message:
                                      'Cek lagi, ada yang belum diisi atau salah tuh!',
                                  type: AppSnackbarType.error,
                                );
                                return;
                              }
                              context.read<LoginBloc>().add(
                                LoginEvent.submitted(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                ),
                              );
                            },
                            child: const Text('Gas Login'),
                          ),
                        ),
                      const SizedBox(height: 16),
                      TextButton(
                        onPressed: () => context.push('/register'),
                        style: TextButton.styleFrom(
                          foregroundColor: theme.colorScheme.primary,
                          textStyle: theme.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        child: const Text('Belum punya akun? Daftar dulu!'),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
