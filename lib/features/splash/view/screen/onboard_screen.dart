import 'package:carousel_slider/carousel_slider.dart';
import 'package:feasto/configs/components/boucing_button_widget.dart';
import 'package:feasto/configs/components/gradient_text.dart';
import 'package:feasto/configs/constants/app_image.dart';
import 'package:feasto/configs/extensions/mediaquery_extensions.dart';
import 'package:feasto/configs/routers/routes_name.dart';
import 'package:feasto/configs/themes/colors.dart';
import 'package:feasto/features/splash/model/onboard_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  final CarouselSliderController _carouselController =
      CarouselSliderController();
  int _activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = context.colorScheme;
    TextTheme textTheme = context.textTheme;
    double scrWidth = context.mediaQueryWidth;
    double scrHeight = context.mediaQueryHeight;
    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SizedBox(
        height: scrHeight,
        width: scrWidth,
        child: Stack(
          children: [
            Positioned(
              top: scrHeight * 0.15,
              child: _carouselWidgetAndIndicator(
                  scrHeight, scrWidth, textTheme, colorScheme),
            ),
            _feastoLogo(scrHeight, textTheme),
            _bottomButtons(scrWidth, scrHeight, textTheme)
          ],
        ),
      ),
    );
  }

  Positioned _feastoLogo(double scrHeight, TextTheme textTheme) {
    return Positioned(
        top: scrHeight * 0.05,
        right: 0,
        left: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImage.feastoLogo,
              height: scrHeight * 0.09,
            ),
            GradientText(
              text: "Feasto",
              style: textTheme.bodyLarge?.copyWith(
                fontSize: scrHeight * 0.025,
                color: Colors.white,
              ),
              gradient: const LinearGradient(
                colors: [
                  Color.fromRGBO(170, 173, 73, 1), // Greenish color
                  Color.fromRGBO(153, 109, 78, 1), // Brownish color
                ],
              ),
            ),
          ],
        ));
  }

  Positioned _bottomButtons(
      double scrWidth, double scrHeight, TextTheme textTheme) {
    return Positioned(
      bottom: 40,
      left: scrWidth * 0.05,
      right: scrWidth * 0.05,
      child: _activeIndex != 1
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _carouselController
                          .animateToPage(1); // This will move to the last slide

                      _activeIndex = 1;
                    });
                  },
                  child: BouncingButtonWidget(
                    child: Container(
                        height: scrHeight * 0.065,
                        width: scrWidth * 0.3,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17),
                            border: Border.all(
                              color: AppColors.primaryColor,
                            )),
                        child: Center(
                          child: Text(
                            "Skip",
                            style: textTheme.bodySmall?.copyWith(
                              color: AppColors.white.withOpacity(.6),
                            ),
                          ),
                        )),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (_activeIndex < onboardItems.length - 1) {
                        _activeIndex++;
                        _carouselController.animateToPage(
                            _activeIndex); // Move to the next page
                      }
                    });
                  },
                  child: BouncingButtonWidget(
                    child: Container(
                      height: scrHeight * 0.065,
                      width: scrWidth * 0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17),
                        color: AppColors.primaryColor,
                      ),
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: AppColors.white.withOpacity(.5),
                      ),
                    ),
                  ),
                ),
              ],
            )
          : GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(RoutesName.signIn);
              },
              child: BouncingButtonWidget(
                child: Container(
                    height: scrHeight * 0.065,
                    width: scrWidth * 0.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(17),
                      color: AppColors.primaryColor,
                    ),
                    child: Center(
                      child: Text(
                        "Get Started",
                        style: textTheme.bodyMedium?.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    )),
              ),
            ),
    );
  }

  SizedBox _carouselWidgetAndIndicator(double scrHeight, double scrWidth,
      TextTheme textTheme, ColorScheme colorScheme) {
    return SizedBox(
      height: scrHeight * 0.9,
      width: scrWidth,
      // color: Colors.amber,
      child: Column(
        children: [
          SizedBox(
              height: scrHeight * 0.7,
              width: scrWidth,
              child: CarouselSlider.builder(
                carouselController:
                    _carouselController, // Add the controller here

                itemCount: onboardItems.length,
                itemBuilder: (context, index, realIndex) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SizedBox(
                      height: scrHeight * 0.8,
                      width: scrWidth,
                      child: Stack(
                        children: [
                          Positioned(
                            right: 0,
                            left: 0,
                            child: SvgPicture.asset(
                              onboardItems.elementAt(index).icon,
                              height: scrHeight * 0.4,
                              width: scrWidth * 0.7,
                            ),
                          ),
                          Positioned(
                              bottom: scrHeight * 0.15,
                              left: 0,
                              right: 0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GradientText(
                                    textAlign: TextAlign.center,
                                    text: onboardItems.elementAt(index).title,
                                    style: textTheme.bodyLarge?.copyWith(
                                      fontSize: scrHeight * 0.026,
                                      color: Colors.white,
                                    ),
                                    gradient: const RadialGradient(
                                      colors: [
                                        Color.fromRGBO(
                                            170, 173, 73, 1), // Greenish color
                                        Color.fromRGBO(153, 109, 78, 1),
                                      ],
                                    ),
                                  ),
                                  (scrHeight * 0.01).height,
                                  SizedBox(
                                    width: scrWidth * 0.7,
                                    child: GradientText(
                                      textAlign: TextAlign.center,
                                      text: onboardItems.elementAt(index).desc,
                                      style: textTheme.bodyMedium?.copyWith(
                                        fontSize: scrHeight * 0.013,
                                        color: Colors.white,
                                      ),
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color.fromRGBO(170, 173, 73,
                                              1), // Greenish color
                                          Color.fromRGBO(153, 109, 78,
                                              1), // Brownish color
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ))
                        ],
                      ),
                    ),
                  );
                },
                options: CarouselOptions(
                  height: scrHeight * 0.7,
                  viewportFraction: 1,
                  enableInfiniteScroll: false,
                  enlargeCenterPage: true,
                  autoPlay: _activeIndex < onboardItems.length - 1,
                  autoPlayInterval: const Duration(seconds: 4),
                  autoPlayAnimationDuration: const Duration(seconds: 2),
                  onPageChanged: (index, reason) {
                    setState(() {
                      _activeIndex = index;
                    });
                  },
                ),
              )),
          AnimatedSmoothIndicator(
            activeIndex: _activeIndex,
            axisDirection: Axis.horizontal,
            count: onboardItems.length,
            effect: ExpandingDotsEffect(
              dotHeight: 5,
              dotWidth: 5,
              activeDotColor: colorScheme.tertiary,
              dotColor: Colors.grey,
            ),
            onDotClicked: (index) {
              _carouselController.animateToPage(
                index,
              );
            },
          ),
        ],
      ),
    );
  }
}
