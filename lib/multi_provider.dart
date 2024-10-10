import 'package:feasto/features/auth/view_model/auth_view_model.dart';
import 'package:feasto/features/splash/view_model/onboard_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyAppMultiProvider extends StatelessWidget {
  const MyAppMultiProvider({super.key, required this.myApp});
  final Widget myApp;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => OnboardViewModel(),
      ),
      ChangeNotifierProvider(
        create: (context) => AuthViewModel(),
      ),
    ], child: myApp);
  }
}
