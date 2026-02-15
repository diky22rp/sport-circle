import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_circle/core/di/injection.dart';
import 'package:sport_circle/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:sport_circle/features/auth/presentation/bloc/login/login_event.dart';
import 'package:sport_circle/features/auth/presentation/bloc/login/login_state.dart';

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

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Welcome, ${state.user.name}!')),
            );
            // Navigate to home
          } else if (state is LoginFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  key: const Key('emailField'),
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16),
                TextField(
                  key: const Key('passwordField'),
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 24),
                if (state is LoginLoading)
                  const CircularProgressIndicator()
                else
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      key: const Key('loginButton'),
                      onPressed: () {
                        context.read<LoginBloc>().add(
                          LoginSubmitted(
                            email: _emailController.text,
                            password: _passwordController.text,
                          ),
                        );
                      },
                      child: const Text('Login'),
                    ),
                  ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    // Navigate to register page
                  },
                  child: const Text('Belum punya akun? Daftar'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
