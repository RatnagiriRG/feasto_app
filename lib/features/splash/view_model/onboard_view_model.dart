import 'dart:io';

import 'package:feasto/configs/routers/routes_name.dart';
import 'package:feasto/data/local/local_storage.dart';
import 'package:feasto/data/local/session_controller.dart';
import 'package:flutter/material.dart';

class OnboardViewModel {
  Future<bool> isInternetConnected() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  Future<void> checkAuthentication(BuildContext context) async {
    final navigatorState = Navigator.of(context);

    await SessionController().getUserFromPreference();
    final localStorage = LocalStorage();
    final userIsLogin = SessionController().isLogin;
    final onboardingComplted =
        await localStorage.readValue("onboardingCompleted");

    if (userIsLogin == true) {
      if (!context.mounted) return;

      navigatorState.pushReplacementNamed(
        RoutesName.homeScreen,
      );
    } else {
      // navigatorState.pushReplacementNamed(
      //   RoutesName.loginScreen,
      // );
    }

    // if (onboardingComplted == "false") {
    //   if (userIsLogin == true) {
    //     if (!context.mounted) return;

    //     navigatorState.pushReplacementNamed(
    //       RoutesName.homeScreen,
    //     );
    //   } else {
    //     // navigatorState.pushReplacementNamed(
    //     //   RoutesName.loginScreen,
    //     // );
    //   }
    // } else {
    //   // navigatorState.pushReplacementNamed(
    //   //   RoutesName.onboardingScreen,
    //   // );
    // }
  }
}
