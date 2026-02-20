import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sport_circle/features/authentication/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:sport_circle/features/category/presentation/bloc/category_bloc.dart';
import 'package:sport_circle/features/category/presentation/pages/category_horizontal_list.dart';
import 'package:sport_circle/features/category/presentation/pages/category_horizontal_list_skeleton.dart';
import 'dart:developer';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? selectedCategoryId;
  final ScrollController _categoryScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<CategoryBloc>().add(FetchCategories());
    context.read<AuthenticationBloc>().add(
      const AuthenticationEvent.fetchUser(),
    );
  }

  @override
  void dispose() {
    _categoryScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        state.whenOrNull(
          loggedOut: () => context.go('/login'),
          unauthenticated: () => context.go('/login'),
          failure: (message) => ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(message))),
        );
      },
      child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          Widget body = state.maybeWhen(
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (user) => SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Search Bar
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search Activities',
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                        contentPadding: const EdgeInsets.symmetric(vertical: 0),
                      ),
                    ),
                  ),
                  // Category Horizontal List
                  BlocBuilder<CategoryBloc, CategoryState>(
                    builder: (context, state) {
                      log('CategoryBloc State: $state');
                      if (state is CategoryLoading) {
                        return const CategoryHorizontalListSkeleton();
                      } else if (state is CategoryLoaded) {
                        log(
                          'Loaded categoriesnya:  ${state.categories.length}',
                        );
                        return CategoryHorizontalList(
                          categories: state.categories,
                          selectedCategoryId: selectedCategoryId,
                          onCategorySelected: (id) {
                            setState(() => selectedCategoryId = id);
                            // TODO: open pop up screen for category filter activity, showing activities based on category selected, created dummy page first
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Category Selected'),
                                content: Text(
                                  'Show activities for category ID: $id',
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                    child: const Text('Close'),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }
                      return const SizedBox(height: 80);
                    },
                  ),
                  // Section Title
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 18, 16, 8),
                    child: Text(
                      'Explore Nearby Activities',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // Activities Horizontal Card List (dummy)
                  SizedBox(
                    height: 180,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: 2, // Ganti dengan jumlah data aktivitas
                      separatorBuilder: (_, __) => const SizedBox(width: 16),
                      itemBuilder: (context, index) {
                        return SizedBox(
                          width: 220,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(18),
                                  ),
                                  child: Image.asset(
                                    'assets/futsal.jpg', // Ganti dengan gambar aktivitas
                                    height: 100,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Weekend Futsal Match',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        'Sat, Poli @',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Row(
                                        children: [
                                          Text(
                                            'IDR 50.000',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13,
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 8,
                                              vertical: 2,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.green[100],
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: const Text(
                                              'Added',
                                              style: TextStyle(
                                                color: Colors.green,
                                                fontSize: 11,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            failure: (message) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 48, color: Colors.red),
                  const SizedBox(height: 16),
                  Text(message, textAlign: TextAlign.center),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => context.read<AuthenticationBloc>().add(
                      const AuthenticationEvent.fetchUser(),
                    ),
                    child: const Text('Coba Lagi'),
                  ),
                ],
              ),
            ),
            orElse: () => const SizedBox.shrink(),
          );
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              toolbarHeight: 0,
              actions: [
                IconButton(
                  icon: const Icon(Icons.logout),
                  onPressed: () {
                    context.read<AuthenticationBloc>().add(
                      const AuthenticationEvent.logout(),
                    );
                  },
                ),
              ],
            ),
            body: body,
          );
        },
      ),
    );
  }
}
