import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:feasto/configs/components/boucing_button_widget.dart';
import 'package:feasto/configs/components/gradient_text.dart';
import 'package:feasto/configs/constants/app_image.dart';
import 'package:feasto/configs/constants/app_svg.dart';
import 'package:feasto/configs/extensions/mediaquery_extensions.dart';
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
  bool _isUserScrolling = false;

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
              top: scrHeight * 0.1,
              bottom: scrHeight * 0.1,
              child: Container(
                height: scrHeight * 0.8,
                width: scrWidth,
                color: Colors.tealAccent,
              ),
            ),
            // SizedBox(
            //   height: scrHeight * 0.8,
            //   child: Column(
            //     children: [
            //       SizedBox(
            //         height: scrHeight * 0.7,
            //         child: GestureDetector(
            //           // onPanDown: (_) {
            //           //   setState(() {
            //           //     _isUserScrolling = true;
            //           //   });
            //           // },
            //           // onPanEnd: (_) {
            //           //   setState(() {
            //           //     _isUserScrolling = false;
            //           //   });
            //           // },
            //           child: CarouselSlider.builder(
            //             itemCount: onboardItems.length,
            //             carouselController: _carouselController,
            //             itemBuilder: (context, index, realIndex) {
            //               return SizedBox(
            //                 // width: scrWidth * 0.7,
            //                 child: Column(
            //                   crossAxisAlignment: CrossAxisAlignment.center,
            //                   children: [
            //                     SizedBox(
            //                       // height: scrHeight * 0.7,
            //                       // width: scrHeight * 0.7,
            //                       child: SvgPicture.asset(
            //                         onboardItems.elementAt(index).icon,
            //                         height: scrHeight * 0.6,
            //                         width: scrWidth * 0.8,
            //                       ),
            //                     ),
            //                     (scrHeight * 0.008).height,
            //                     Text(
            //                       onboardItems.elementAt(index).title,
            //                       style: textTheme.bodyLarge?.copyWith(
            //                         fontSize: scrHeight * 0.015,
            //                         fontWeight: FontWeight.w700,
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               );
            //             },
            //             options: CarouselOptions(
            //               height: scrHeight * 0.2,
            //               viewportFraction: 0.8,
            //               autoPlay: !_isUserScrolling &&
            //                   _activeIndex < onboardItems.length - 1,
            //               autoPlayInterval: const Duration(seconds: 4),
            //               autoPlayAnimationDuration: const Duration(seconds: 2),
            //               onPageChanged: (index, reason) {
            //                 setState(() {
            //                   _activeIndex = index;
            //                 });
            //               },
            //             ),
            //           ),
            //         ),
            //       ),
            //       AnimatedSmoothIndicator(
            //         activeIndex: _activeIndex,
            //         axisDirection: Axis.horizontal,
            //         count: onboardItems.length,
            //         effect: ExpandingDotsEffect(
            //           dotHeight: 5,
            //           dotWidth: 5,
            //           activeDotColor: colorScheme.tertiary,
            //           dotColor: Colors.grey,
            //         ),
            //         onDotClicked: (index) {
            //           _carouselController.animateToPage(
            //             index,
            //           );
            //         },
            //       ),
            //     ],
            //   ),
            // ),

            Positioned(
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
                )),
            Positioned(
                bottom: 40,
                left: scrWidth * 0.05,
                right: scrWidth * 0.05,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BouncingButtonWidget(
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
                    BouncingButtonWidget(
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
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
