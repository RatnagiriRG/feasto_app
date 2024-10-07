import 'package:feasto/configs/extensions/mediaquery_extensions.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = context.colorScheme;
    TextTheme textTheme = context.textTheme;
    double scrWidth = context.mediaQueryWidth;
    double scrHeight = context.mediaQueryHeight;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: Center(
        child: Text("dddd"),
      ),
    );
  }
}
