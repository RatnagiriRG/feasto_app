import 'package:feasto/configs/extensions/mediaquery_extensions.dart';
import 'package:feasto/configs/themes/colors.dart';
import 'package:feasto/features/auth/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthNameTextField extends StatelessWidget {
  const AuthNameTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = context.colorScheme;
    TextTheme textTheme = context.textTheme;
    double scrHeight = context.mediaQueryHeight;
    double scrWidth = context.mediaQueryWidth;
    return Selector<AuthViewModel, TextEditingController>(
      selector: (p0, p1) => p1.nameController,
      builder: (context, value, child) {
        return Column(
          children: [
            SizedBox(
              width: scrWidth * 0.83,
              child: Row(
                children: [
                  Text(
                    "Name",
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
              child: TextField(
                controller: value,
                keyboardType: TextInputType.text,
                style: textTheme.bodyMedium?.copyWith(color: AppColors.white),
                cursorColor: Colors.amber,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(16.0),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
