import 'package:feasto/configs/constants/app_svg.dart';

class OnboardModel {
  final String icon;
  final String title;
  final String desc;

  OnboardModel(this.icon, this.title, this.desc);
}

List<OnboardModel> onboardItems = [
  OnboardModel(AppSvg.onboardWelcome, "Welcome",
      "It’s a pleasure to meet you. We are excited that you’re here so let’s get started!"),
  OnboardModel(AppSvg.iceCreamGirl, "Choose your food",
      "Easily find your type of food craving and you’ll get delivery in wide range."),
];
