import 'package:feasto/configs/components/app_bar_widget.dart';
import 'package:feasto/configs/components/boucing_button_widget.dart';
import 'package:feasto/configs/components/gradient_text.dart';
import 'package:feasto/configs/constants/app_image.dart';
import 'package:feasto/configs/extensions/mediaquery_extensions.dart';
import 'package:feasto/configs/themes/colors.dart';
import 'package:feasto/features/auth/view/widgets/auth_email_text_field.dart';
import 'package:feasto/features/auth/view/widgets/auth_name_text_field.dart';
import 'package:feasto/features/auth/view/widgets/auth_password_text_field.dart';
import 'package:feasto/features/auth/view/widgets/auth_phone_text_field.dart';
import 'package:feasto/features/auth/view/widgets/auth_re_password_text_field.dart';
import 'package:feasto/features/auth/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateScreen extends StatelessWidget {
  const CreateScreen({super.key});

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
            // Static background image
            Center(
              child: Opacity(
                opacity: .2,
                child: Image.asset(AppImage.feastoLogo),
              ),
            ),
            // Scrollable content
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: scrHeight * 0.02),
                child: Column(
                  children: [
                    const AppBarWidget(
                      title: "",
                    ),
                    GradientText(
                      textAlign: TextAlign.center,
                      text: "Create Account",
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
                          "Enter your Name, Email and Password for sign up.\n",
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
                    const AuthNameTextField(),
                    (scrHeight * 0.03).height,
                    const AuthEmailTextField(),
                    (scrHeight * 0.025).height,
                    const AuthPhoneTextField(),
                    (scrHeight * 0.025).height,
                    const AuthPasswordTextField(),
                    (scrHeight * 0.025).height,
                    const AuthRePasswordTextField(),
                    (scrHeight * 0.025).height,
                    GestureDetector(
                      onTap: () {
                        context.read<AuthViewModel>().signUp(context);
                      },
                      child: BouncingButtonWidget(
                        child: Container(
                          height: scrHeight * 0.06,
                          width: scrWidth * 0.85,
                          decoration: BoxDecoration(
                            color: colorScheme.primary,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              "Sign Up",
                              style: textTheme.bodyMedium?.copyWith(
                                color: AppColors.white.withOpacity(.6),
                              ),
                            ),
                          ),
                        ),
                      ),
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
