import 'package:feasto/configs/components/gradient_text.dart';
import 'package:feasto/configs/constants/app_image.dart';
import 'package:feasto/configs/extensions/mediaquery_extensions.dart';
import 'package:feasto/configs/routers/routes_name.dart';
import 'package:feasto/features/splash/view_model/onboard_view_model.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _rotationController;
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..forward();

    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.5).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.easeInOut),
    );

    Future.delayed(const Duration(seconds: 1), _startZoomAnimation);

    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        OnboardViewModel().checkAuthentication(context);
        _rotationController.stop();
      }
    });
  }

  void _startZoomAnimation() {
    _scaleController.forward();
  }

  @override
  void dispose() {
    _rotationController.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = context.colorScheme;
    TextTheme textTheme = context.textTheme;
    double scrWidth = context.mediaQueryWidth;
    double scrHeight = context.mediaQueryHeight;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: Stack(
        children: [
          Center(
            child: AnimatedBuilder(
              animation:
                  Listenable.merge([_rotationController, _scaleController]),
              builder: (context, child) {
                return Transform.rotate(
                  angle: _rotationController.value *
                      2.4 *
                      math.pi, // Full rotation
                  child: Transform.scale(
                    scale: _scaleAnimation.value, // Zoom effect
                    child: child,
                  ),
                );
              },
              child: Image.asset(
                AppImage.feastoLogo,
                height: scrHeight * 0.15,
              ),
            ),
          ),
          Positioned(
            bottom: scrHeight * 0.1,
            left: 0,
            right: 0,
            child: Center(
              child: GradientText(
                text: "RatnaDev Corp",
                style: textTheme.bodyMedium?.copyWith(
                  fontSize: scrHeight * 0.013,
                  color: Colors.white,
                ),
                gradient: const LinearGradient(
                  colors: [
                    Color.fromRGBO(170, 173, 73, 1), // Greenish color
                    Color.fromRGBO(153, 109, 78, 1), // Brownish color
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
