import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:sport_circle/features/activity/presentation/bloc/activity_bloc.dart';
import 'package:sport_circle/features/category/presentation/bloc/category_bloc.dart';
import 'core/di/injection.dart';
import 'core/presentation/bloc_observer.dart';
import 'core/themes/app_theme.dart';
import 'core/routes/app_router.dart';
import 'package:sport_circle/features/authentication/presentation/bloc/authentication/authentication_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  Bloc.observer = AppBlocObserver();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<AuthenticationBloc>()),
        BlocProvider(create: (context) => getIt<CategoryBloc>()),
        BlocProvider(create: (context) => getIt<ActivityBloc>()),
      ],
      child: const SportCircleApp(),
    ),
  );
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
