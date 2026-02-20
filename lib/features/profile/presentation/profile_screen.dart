import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sport_circle/core/presentation/widgets/app_snackbar.dart';
import 'package:sport_circle/core/presentation/widgets/input_field.dart';
import 'package:sport_circle/core/utils/validators.dart';
import 'package:sport_circle/features/authentication/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:sport_circle/features/profile/presentation/widgets/profile_header.dart';
import 'package:sport_circle/features/profile/presentation/widgets/profile_menu_item.dart';
import 'package:sport_circle/features/profile/presentation/widgets/profile_section.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        state.whenOrNull(
          unauthenticated: () {
            AppSnackbar.show(
              context,
              message: 'Berhasil keluar akun',
              type: AppSnackbarType.success,
            );
            context.goNamed('login');
          },
          loading: () {
            AppSnackbar.show(
              context,
              message: 'Memuat data akun...',
              type: AppSnackbarType.info,
            );
          },
        );
      },
      child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          final userName = state.maybeWhen(
            loaded: (user) => user.name,
            orElse: () => '-',
          );
          final email = state.maybeWhen(
            loaded: (user) => user.email,
            orElse: () => '-',
          );
          return Scaffold(
            backgroundColor: Colors.grey[100],
            appBar: AppBar(
              title: const Text(
                'Profile',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              foregroundColor: Colors.black,
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfileHeader(name: userName, email: email),
                  const SizedBox(height: 24),
                  ProfileSection(
                    title: 'Pengaturan Akun',
                    children: [
                      ProfileMenuItem(
                        icon: Icons.settings_outlined,
                        label: 'Edit Profil & Ganti Password',
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            builder: (context) => DraggableScrollableSheet(
                              expand: false,
                              initialChildSize: 1,
                              minChildSize: 1,
                              maxChildSize: 1,
                              builder: (context, scrollController) => Container(
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(24),
                                  ),
                                ),
                                child: _AccountSettingsForm(
                                  scrollController: scrollController,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      ProfileMenuItem(
                        icon: Icons.logout,
                        label: 'Logout',
                        isDestructive: true,
                        onTap: () => _confirmLogout(context),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _confirmLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Apakah Anda yakin ingin keluar?'),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Batal', style: TextStyle(color: Colors.grey)),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext);
              context.read<AuthenticationBloc>().add(
                const AuthenticationEvent.logout(),
              );
            },
            child: const Text(
              'Keluar',
              style: TextStyle(
                color: Colors.redAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AccountSettingsForm extends StatefulWidget {
  final ScrollController? scrollController;
  const _AccountSettingsForm({this.scrollController});

  @override
  State<_AccountSettingsForm> createState() => _AccountSettingsFormState();
}

class _AccountSettingsFormState extends State<_AccountSettingsForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  final _passwordController = TextEditingController();
  final _cPasswordController = TextEditingController();

  String? _nameError;
  String? _emailError;
  String? _phoneError;
  String? _passwordError;
  String? _cPasswordError;
  String? _passwordMatchError;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    final user = context.read<AuthenticationBloc>().state.maybeWhen(
      loaded: (user) => user,
      orElse: () => null,
    );
    _nameController = TextEditingController(text: user?.name ?? '');
    _emailController = TextEditingController(text: user?.email ?? '');
    _phoneController = TextEditingController(text: user?.phoneNumber ?? '');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _cPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        state.whenOrNull(
          updateProfileLoading: () {
            setState(() => isLoading = true);
          },
          updateProfileSuccess: (user) {
            setState(() => isLoading = false);
            Navigator.of(context).pop();
            AppSnackbar.show(
              context,
              message: 'Data berhasil diperbarui',
              type: AppSnackbarType.success,
            );
            context.read<AuthenticationBloc>().add(
              const AuthenticationEvent.fetchUser(),
            );
          },
          updateProfileFailure: (msg) {
            setState(() => isLoading = false);
            AppSnackbar.show(
              context,
              message: msg,
              type: AppSnackbarType.error,
            );
          },
        );
      },
      child: SingleChildScrollView(
        controller: widget.scrollController,
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            constraints: const BoxConstraints(maxWidth: 400),
            // decoration: BoxDecoration(
            //   color: Colors.white,
            //   borderRadius: BorderRadius.circular(24),
            //   boxShadow: [
            //     BoxShadow(
            //       color: Colors.black12,
            //       blurRadius: 16,
            //       offset: const Offset(0, 8),
            //     ),
            //   ],
            // ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  ),
                  Text(
                    'Edit Profil & Ganti Password',
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Ubah data akunmu di bawah ini',
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
                    label: 'Phone Number',
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    errorText: _phoneError,
                    icon: Icons.phone,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Ganti Password (Opsional)',
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  InputField(
                    label: 'Password Baru',
                    controller: _passwordController,
                    isPassword: true,
                    errorText: _passwordError,
                    icon: Icons.lock_outline,
                  ),
                  const SizedBox(height: 16),
                  InputField(
                    label: 'Konfirmasi Password Baru',
                    controller: _cPasswordController,
                    isPassword: true,
                    errorText: _cPasswordError ?? _passwordMatchError,
                    icon: Icons.lock_outline,
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
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
                      onPressed: isLoading
                          ? null
                          : () {
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
                                _phoneError = null;
                                _passwordError =
                                    _passwordController.text.isNotEmpty
                                    ? Validators.validateNotEmpty(
                                        _passwordController.text,
                                        'Password Baru',
                                      )
                                    : null;
                                _cPasswordError =
                                    _cPasswordController.text.isNotEmpty
                                    ? Validators.validateNotEmpty(
                                        _cPasswordController.text,
                                        'Konfirmasi Password Baru',
                                      )
                                    : null;
                                _passwordMatchError =
                                    (_passwordController.text.isNotEmpty ||
                                        _cPasswordController.text.isNotEmpty)
                                    ? Validators.validatePasswordMatch(
                                        _passwordController.text,
                                        _cPasswordController.text,
                                      )
                                    : null;
                              });
                              final errorMsg =
                                  _nameError ??
                                  _emailError ??
                                  _phoneError ??
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
                              context.read<AuthenticationBloc>().add(
                                AuthenticationEvent.updateProfile(
                                  name: _nameController.text,
                                  email: _emailController.text,
                                  phoneNumber: _phoneController.text,
                                  password: _passwordController.text.isNotEmpty
                                      ? _passwordController.text
                                      : null,
                                  cPassword:
                                      _cPasswordController.text.isNotEmpty
                                      ? _cPasswordController.text
                                      : null,
                                ),
                              );
                            },
                      child: isLoading
                          ? const SizedBox(
                              height: 24,
                              width: 24,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            )
                          : const Text('Simpan Perubahan'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
