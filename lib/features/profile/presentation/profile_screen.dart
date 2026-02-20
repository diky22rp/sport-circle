import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_circle/features/authentication/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sport_circle/features/profile/presentation/widgets/profile_header.dart';
import 'package:sport_circle/features/profile/presentation/widgets/profile_menu_item.dart';
import 'package:sport_circle/features/profile/presentation/widgets/profile_section.dart';
import 'package:sport_circle/core/presentation/widgets/app_snackbar.dart';

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
          // Opsional: Jika kamu ingin snackbar "Loading" muncul saat proses
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
        // Builder khusus menangani UI
        builder: (context, state) {
          final userName = state.maybeWhen(
            loaded: (user) => user.name,
            orElse: () => 'User',
          );

          final email = state.maybeWhen(
            loaded: (user) => user.email,
            orElse: () => 'Email tidak tersedia',
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
                    title: 'Settings',
                    children: [
                      ProfileMenuItem(
                        icon: Icons.settings_outlined,
                        label: 'Account Settings',
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

// Tambahkan widget form di bawah class ProfileScreen
class _AccountSettingsForm extends StatefulWidget {
  final ScrollController? scrollController;
  const _AccountSettingsForm({this.scrollController});

  @override
  State<_AccountSettingsForm> createState() => _AccountSettingsFormState();
}

class _AccountSettingsFormState extends State<_AccountSettingsForm> {
  final _formKey = GlobalKey<FormState>();
  late String name;
  late String email;
  late String phoneNumber;

  @override
  void initState() {
    super.initState();
    final user = context.read<AuthenticationBloc>().state.maybeWhen(
      loaded: (user) => user,
      orElse: () => null,
    );
    name = user?.name ?? '';
    email = user?.email ?? '';
    phoneNumber = user?.phoneNumber ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: widget.scrollController,
      child: Column(
        children: [
          // Baris tombol X
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Account Details',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Name'),
                    initialValue: name,
                    onChanged: (val) => name = val,
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Email'),
                    initialValue: email,
                    onChanged: (val) => email = val,
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Phone Number',
                    ),
                    initialValue: phoneNumber,
                    onChanged: (val) => phoneNumber = val,
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // TODO: Dispatch event update profile
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Data berhasil diperbarui'),
                            ),
                          );
                        }
                      },
                      child: const Text('Simpan Perubahan'),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: TextButton(
                      onPressed: () => _showChangePasswordDialog(context),
                      child: const Text('Ganti Password'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showChangePasswordDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) => const _ChangePasswordForm(),
    );
  }
}

class _ChangePasswordForm extends StatefulWidget {
  const _ChangePasswordForm();

  @override
  State<_ChangePasswordForm> createState() => _ChangePasswordFormState();
}

class _ChangePasswordFormState extends State<_ChangePasswordForm> {
  final _formKey = GlobalKey<FormState>();
  String oldPassword = '';
  String newPassword = '';
  String confirmPassword = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 24,
        bottom: MediaQuery.of(context).viewInsets.bottom + 24,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
              'Ganti Password',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Password Lama'),
              obscureText: true,
              onChanged: (val) => oldPassword = val,
            ),
            const SizedBox(height: 8),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Password Baru'),
              obscureText: true,
              onChanged: (val) => newPassword = val,
            ),
            const SizedBox(height: 8),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Konfirmasi Password Baru',
              ),
              obscureText: true,
              onChanged: (val) => confirmPassword = val,
              validator: (val) =>
                  val != newPassword ? 'Password tidak sama' : null,
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // TODO: Dispatch event ganti password
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Password berhasil diganti'),
                      ),
                    );
                  }
                },
                child: const Text('Simpan Password'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
