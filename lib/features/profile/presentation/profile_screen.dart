import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sport_circle/core/presentation/widgets/app_snackbar.dart';
import 'package:sport_circle/features/authentication/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:sport_circle/features/profile/presentation/widgets/profile_header.dart';
import 'package:sport_circle/features/profile/presentation/widgets/profile_menu_item.dart';
import 'package:sport_circle/features/profile/presentation/widgets/profile_section.dart';
import 'package:sport_circle/features/profile/presentation/widgets/profile_setting_form.dart';

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
                                child: ProfileSettingForm(
                                  scrollController: scrollController,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      ProfileMenuItem(
                        icon: Icons.logout,
                        label: 'Keluar',
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
        title: const Text('Keluar'),
        content: const Text('Apakah yakin mau keluar?'),
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
