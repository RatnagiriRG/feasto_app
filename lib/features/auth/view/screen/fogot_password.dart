import 'package:feasto/configs/components/app_bar_widget.dart';
import 'package:feasto/configs/components/boucing_button_widget.dart';
import 'package:feasto/configs/components/gradient_text.dart';
import 'package:feasto/configs/constants/app_image.dart';
import 'package:feasto/configs/extensions/mediaquery_extensions.dart';
import 'package:feasto/configs/themes/colors.dart';
import 'package:flutter/material.dart';

class FogotPassword extends StatelessWidget {
  const FogotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = context.colorScheme;
    TextTheme textTheme = context.textTheme;
    double scrHeight = context.mediaQueryHeight;
    double scrWidth = context.mediaQueryWidth;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: Stack(
          children: [
            // Positioned image to keep it static while the rest of the content scrolls
            Center(
              child: Opacity(
                opacity: .2,
                child: Image.asset(AppImage.feastoLogo),
              ),
            ),

            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: scrHeight * 0.02),
                child: Column(
                  children: [
                    const AppBarWidget(
                      title: "Forgot password",
                    ),
                    GradientText(
                      textAlign: TextAlign.center,
                      text: "",
                      style: textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontSize: scrHeight * 0.025,
                      ),
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromRGBO(170, 173, 73, 1), // Greenish color
                          Color.fromRGBO(153, 109, 78, 1), // Brownish color
                        ],
                      ),
                    ),
                    (scrHeight * 0.01).height,
                    GradientText(
                      textAlign: TextAlign.center,
                      text:
                          "Enter your email address and we will send you \n reset instructions.",
                      style: textTheme.bodyLarge?.copyWith(
                        color: Colors.white,
                        fontSize: scrHeight * 0.012,
                      ),
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromRGBO(170, 173, 73, 1), // Greenish color
                          Color.fromRGBO(153, 109, 78, 1), // Brownish color
                        ],
                      ),
                    ),
                    (scrHeight * 0.03).height,
                    Column(
                      children: [
                        SizedBox(
                          width: scrWidth * 0.83,
                          child: Row(
                            children: [
                              Text(
                                "Email",
                                style: textTheme.bodyMedium?.copyWith(
                                  fontSize: scrHeight * 0.012,
                                  color: AppColors.white.withOpacity(.6),
                                ),
                              )
                            ],
                          ),
                        ),
                        (scrHeight * 0.007).height,
                        Container(
                          height: scrHeight * 0.06,
                          width: scrWidth * 0.85,
                          decoration: BoxDecoration(
                            color: AppColors.black.withOpacity(.4),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: AppColors.white.withOpacity(.2),
                            ),
                          ),
                          child: const TextField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(16.0),
                            ),
                          ),
                        ),
                        (scrHeight * 0.03).height,
                        BouncingButtonWidget(
                          child: Container(
                            height: scrHeight * 0.06, // Corrected height
                            width: scrWidth * 0.85,
                            decoration: BoxDecoration(
                              color: colorScheme.primary,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text(
                                "Reset Password",
                                style: textTheme.bodyMedium?.copyWith(
                                  color: AppColors.white.withOpacity(.6),
                                ),
                              ),
                            ),
                          ),
                        ),
                        (scrHeight * 0.03).height,
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
