import 'package:feasto/configs/components/gradient_text.dart';
import 'package:feasto/configs/constants/app_image.dart';
import 'package:feasto/configs/extensions/mediaquery_extensions.dart';
import 'package:feasto/configs/routers/routes_name.dart';
import 'package:flutter/material.dart';

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
    );

    _rotationController.forward();

    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.5).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.easeInOut),
    );

    Future.delayed(const Duration(seconds: 1), () {
      _startZoomAnimation();
    });

    Future.delayed(const Duration(seconds: 3), () {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushNamed(RoutesName.onboardingScreen);
      _rotationController.stop();
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
              animation: _rotationController,
              builder: (context, child) {
                return AnimatedBuilder(
                  animation: _scaleController,
                  builder: (context, child) {
                    return Transform.rotate(
                      angle: _rotationController.value *
                          2.4 *
                          3.1416, // Full rotation in radians
                      child: Transform.scale(
                        scale: _scaleAnimation.value, // Apply zoom effect
                        child: child,
                      ),
                    );
                  },
                  child: Image.asset(
                    AppImage.feastoLogo,
                    height: scrHeight * 0.15,
                  ),
                );
              },
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
