import 'package:flutter/material.dart';
import 'core/themes/app_theme.dart';
import 'core/routes/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const SportCircleApp());
}

class SportCircleApp extends StatelessWidget {
  const SportCircleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'SportCircle',
      theme: AppTheme.light(),
      routeInformationParser: appRouter.routeInformationParser,
      routerDelegate: appRouter.routerDelegate,
      debugShowCheckedModeBanner: false,
    );
  }
}
