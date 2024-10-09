import 'package:feasto/configs/routers/routes_name.dart';
import 'package:feasto/configs/routers/routes_services.dart';
import 'package:feasto/features/auth/view/screen/signin_screen.dart';
import 'package:feasto/features/splash/view/screen/onboard_screen.dart';
import 'package:flutter/material.dart';

class RouteManager {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final argument = settings.arguments;
    switch (settings.name) {
      case RoutesName.onboardingScreen:
        return CustomPageRouteSlowTransition(const OnboardScreen());

      case RoutesName.signIn:
        return CustomPageRouteFastTransition(const SigninScreen());

      default:
        return CustomPageRouteSlowTransition(
          const Scaffold(
            body: SafeArea(
              child: Center(
                child: Text("Please try again later....."),
              ),
            ),
          ),
        );
    }
  }
}
