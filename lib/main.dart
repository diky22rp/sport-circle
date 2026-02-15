import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'core/di/injection.dart';
import 'core/presentation/bloc_observer.dart';
import 'core/themes/app_theme.dart';
import 'core/routes/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  Bloc.observer = AppBlocObserver();
  runApp(const SportCircleApp());
}

class SportCircleApp extends StatelessWidget {
  const SportCircleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'SportCircle',
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
