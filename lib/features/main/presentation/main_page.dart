import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sport_circle/core/themes/app_theme.dart';

class MainPage extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainPage({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MainPageCubit(),
      child: BlocBuilder<MainPageCubit, int>(
        builder: (context, selectedIndex) {
          return Scaffold(
            body: navigationShell,
            bottomNavigationBar: Container(
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.surface,
                    blurRadius: 20,
                    offset: Offset(0, -5),
                  ),
                ],
              ),
              child: NavigationBarTheme(
                data: NavigationBarThemeData(
                  indicatorColor: AppTheme.primary.withValues(alpha: 0.1),
                  labelTextStyle: WidgetStateProperty.all(
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                ),
                child: NavigationBar(
                  height: 70,
                  elevation: 0,
                  backgroundColor: AppTheme.surface,
                  selectedIndex: selectedIndex,
                  onDestinationSelected: (index) {
                    context.read<MainPageCubit>().setIndex(index);
                    navigationShell.goBranch(
                      index,
                      initialLocation: index == navigationShell.currentIndex,
                    );
                  },
                  destinations: [
                    for (var i = 0; i < 4; i++)
                      NavigationDestination(
                        icon: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Icon(
                              [
                                Icons.search_rounded,
                                Icons.favorite_border_outlined,
                                Icons.receipt_long_sharp,
                                Icons.person_outline_rounded,
                              ][i],
                              color: selectedIndex == i
                                  ? AppTheme.primary
                                  : Colors.grey,
                            ),
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeOut,
                              margin: const EdgeInsets.only(bottom: 0),
                              width: selectedIndex == i ? 32 : 0,
                              height: selectedIndex == i ? 6 : 0,
                              decoration: BoxDecoration(
                                color: selectedIndex == i
                                    ? AppTheme.primary.withAlpha(38)
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ],
                        ),
                        selectedIcon: Icon(
                          [
                            Icons.search_outlined,
                            Icons.favorite_border_rounded,
                            Icons.receipt_long_rounded,
                            Icons.person_rounded,
                          ][i],
                          color: AppTheme.primary,
                        ),
                        label: ['Activity', 'Like', 'History', 'Profile'][i],
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

class MainPageCubit extends Cubit<int> {
  MainPageCubit() : super(0);

  void setIndex(int index) => emit(index);
}
