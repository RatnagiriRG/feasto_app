import 'package:feasto/configs/routers/routes_manager.dart';
import 'package:feasto/configs/routers/routes_services.dart';
import 'package:feasto/configs/themes/theme.dart';
import 'package:feasto/features/splash/view/screen/splash_screen.dart';
import 'package:feasto/multi_provider.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const MyAppMultiProvider(myApp: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context)
            .copyWith(textScaler: const TextScaler.linear(1.0)),
        child: child ?? const SizedBox(),
      ),
      debugShowCheckedModeBanner: false,
      title: 'feasto',
      navigatorKey: NavigationService.navigatorKey,
      onGenerateRoute: RouteManager.generateRoute,
      home: const SplashScreen(),
      theme: MyAppTheme.dark,
    );
  }
}
