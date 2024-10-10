import 'package:feasto/configs/components/app_bar_widget.dart';
import 'package:feasto/configs/components/boucing_button_widget.dart';
import 'package:feasto/configs/components/gradient_text.dart';
import 'package:feasto/configs/constants/app_image.dart';
import 'package:feasto/configs/extensions/mediaquery_extensions.dart';
import 'package:feasto/configs/routers/routes_name.dart';
import 'package:feasto/configs/themes/colors.dart';
import 'package:feasto/features/auth/view/widgets/auth_password_text_field.dart';
import 'package:feasto/features/auth/view/widgets/auth_email_text_field.dart';
import 'package:feasto/features/auth/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  late AuthViewModel _authViewModel;

  @override
  void initState() {
    _authViewModel = context.read<AuthViewModel>();
    _authViewModel.initlization();
    super.initState();
  }

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
                      title: "Sign In",
                    ),
                    GradientText(
                      textAlign: TextAlign.center,
                      text: "Welcome to Feasto",
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
                          "Enter your email and password for signin.\nEnjoy your food :)",
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
                    const AuthEmailTextField(),
                    (scrHeight * 0.025).height,
                    const AuthPasswordTextField(),
                    (scrHeight * 0.025).height,
                    Column(
                      children: [
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(RoutesName.forgotPassword);
                          },
                          child: BouncingButtonWidget(
                            child: SizedBox(
                              width: scrWidth * 0.83,
                              child: Row(
                                children: [
                                  Text(
                                    "Forgot password?",
                                    style: textTheme.bodyMedium?.copyWith(
                                      fontSize: scrHeight * 0.012,
                                      color: AppColors.white.withOpacity(.6),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        (scrHeight * 0.02).height,
                        GestureDetector(
                          onTap: () {
                            context.read<AuthViewModel>().signIn();
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
                                  "Sign in",
                                  style: textTheme.bodyMedium?.copyWith(
                                    color: AppColors.white.withOpacity(.6),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        (scrHeight * 0.03).height,
                        SizedBox(
                          width: scrWidth * 0.83,
                          child: Row(
                            children: [
                              Text(
                                "Don’t have an account? ",
                                style: textTheme.bodyMedium?.copyWith(
                                  fontSize: scrHeight * 0.012,
                                  color: AppColors.white.withOpacity(.6),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed(RoutesName.createScreen);
                                  // Navigate to create new account screen
                                },
                                child: BouncingButtonWidget(
                                  child: Text(
                                    " Create new account.",
                                    style: textTheme.bodyLarge?.copyWith(
                                      fontSize: scrHeight * 0.012,
                                      color: AppColors.white.withOpacity(.8),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
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
