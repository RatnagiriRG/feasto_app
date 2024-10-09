import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final Gradient gradient;
  final TextAlign? textAlign;

  const GradientText({
    Key? key,
    required this.text,
    required this.gradient,
    this.style,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(
        textAlign: textAlign,
        text,
        style: style?.copyWith(
          color: Colors.white, // Set a color to enable ShaderMask to work
        ),
      ),
    );
  }
}
