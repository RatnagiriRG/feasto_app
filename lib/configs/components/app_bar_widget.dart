import 'package:feasto/configs/components/boucing_button_widget.dart';
import 'package:feasto/configs/extensions/mediaquery_extensions.dart';
import 'package:feasto/configs/themes/colors.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
    required this.title,
    this.backButton,
    this.textColor,
    this.backButtonColor,
  });

  final String title;
  final VoidCallback? backButton;
  final Color? textColor;
  final Color? backButtonColor;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = context.colorScheme;
    TextTheme textTheme = context.textTheme;
    double scrHeight = context.mediaQueryHeight;
    double scrWidth = context.mediaQueryWidth;
    return Container(
      child: Column(
        children: [
          (scrHeight * 0.02).height,
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: scrHeight * 0.020,
            ),
            child: Row(
              children: [
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: backButton ??
                      () {
                        Navigator.of(context).pop();
                      },
                  child: BouncingButtonWidget(
                    child: Container(
                        width: scrWidth * 0.1,
                        height: scrWidth * 0.1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.primaryColor,
                        ),
                        child: Icon(
                          Icons.arrow_back_ios_rounded,
                          color: backButtonColor ??
                              colorScheme.tertiary.withOpacity(.6),
                          size: scrHeight * 0.02,
                        )),
                  ),
                ),
                (scrWidth * 0.05).width,
                Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.titleLarge?.copyWith(
                    fontSize: scrHeight * 0.018,
                    color: textColor ?? colorScheme.tertiary,
                  ),
                ),
              ],
            ),
          ),
          (scrHeight * 0.02).height,
        ],
      ),
    );
  }
}
