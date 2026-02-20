import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sport_circle/core/di/injection.dart';
import 'package:sport_circle/core/presentation/widgets/app_snackbar.dart';
import 'package:sport_circle/core/presentation/widgets/input_field.dart';
import 'package:sport_circle/core/utils/validators.dart';
import 'package:sport_circle/features/authentication/presentation/bloc/register/register_bloc.dart';
import 'package:sport_circle/features/authentication/presentation/bloc/register/register_event.dart';
import 'package:sport_circle/features/authentication/presentation/bloc/register/register_state.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<RegisterBloc>(),
      child: const _RegisterView(),
    );
  }
}

class _RegisterView extends StatefulWidget {
  const _RegisterView();

  @override
  State<_RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<_RegisterView> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _cPasswordController = TextEditingController();

  String? _nameError;
  String? _emailError;
  String? _passwordError;
  String? _cPasswordError;
  String? _passwordMatchError;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _cPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (user) {
            AppSnackbar.show(
              context,
              message: 'Berhasil daftar, ${user.name}!',
              type: AppSnackbarType.success,
            );
            context.go('/login');
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
      child: BlocBuilder<RegisterBloc, RegisterState>(
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
                      'Ayo Gabung, Biar Terhubung!',
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Isi data dulu, biar bisa gabung!',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.secondary,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),
                    InputField(
                      label: 'Nama',
                      controller: _nameController,
                      errorText: _nameError,
                      isMandatory: true,
                      icon: Icons.person,
                    ),
                    const SizedBox(height: 16),
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
                    const SizedBox(height: 16),
                    InputField(
                      label: 'Konfirmasi Password',
                      controller: _cPasswordController,
                      isPassword: true,
                      errorText: _cPasswordError ?? _passwordMatchError,
                      isMandatory: true,
                      icon: Icons.lock_outline,
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
                          key: const Key('registerButton'),
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
                              _nameError = Validators.validateNotEmpty(
                                _nameController.text,
                                'Nama',
                              );
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
                              _cPasswordError = Validators.validateNotEmpty(
                                _cPasswordController.text,
                                'Konfirmasi Password',
                              );
                              _passwordMatchError =
                                  Validators.validatePasswordMatch(
                                    _passwordController.text,
                                    _cPasswordController.text,
                                  );
                            });
                            final errorMsg =
                                _nameError ??
                                _emailError ??
                                _passwordError ??
                                _cPasswordError ??
                                _passwordMatchError;
                            if (errorMsg != null) {
                              AppSnackbar.show(
                                context,
                                message:
                                    'Cek lagi, ada yang belum diisi atau salah tuh!',
                                type: AppSnackbarType.error,
                              );
                              return;
                            }
                            context.read<RegisterBloc>().add(
                              RegisterEvent.submitted(
                                name: _nameController.text,
                                email: _emailController.text,
                                password: _passwordController.text,
                                cPassword: _cPasswordController.text,
                              ),
                            );
                          },
                          child: const Text('Gas Daftar'),
                        ),
                      ),
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: () => context.go('/login'),
                      style: TextButton.styleFrom(
                        foregroundColor: theme.colorScheme.primary,
                        textStyle: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      child: const Text('Udah punya akun? Login langsung!'),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
