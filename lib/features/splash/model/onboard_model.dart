import 'package:feasto/configs/constants/app_svg.dart';

class OnboardModel {
  final String icon;
  final String title;
  final String desc;

  OnboardModel(this.icon, this.title, this.desc);
}

List<OnboardModel> onboardItems = [
  OnboardModel(AppSvg.onBoardSvg1, "Welcome",
      "It’s a pleasure to meet you. We are excited that you’re here so let’s get started!"),
  OnboardModel(AppSvg.onBoardSvg2, "All your favorites",
      "Order from the best local restaurants with easy, on-demand delivery."),
  OnboardModel(AppSvg.onBoardSvg3, "Free delivery offers",
      "Free delivery for new customers via Apple Pay and others payment methods."),
  OnboardModel(AppSvg.onBoardSvg4, "Choose your food",
      "Easily find your type of food craving and you’ll get delivery in wide range."),
];
