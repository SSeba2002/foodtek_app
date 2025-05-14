import 'package:flutter/material.dart';
import 'package:foodtek_project/l10n/generated/app_localizations.dart';

List<String> foodTitles(BuildContext context) {
  return [
    AppLocalizations.of(context)!.topRated,
    AppLocalizations.of(context)!.recommend,
    AppLocalizations.of(context)!.chooseFood,
    AppLocalizations.of(context)!.turnOnLocation,
  ];
}

List<String> foodDescriptions(BuildContext context) {
  return [
    AppLocalizations.of(context)!.welcomeSubtitle,
    AppLocalizations.of(context)!.getDeliverySubtitle,
    AppLocalizations.of(context)!.chooseFoodSubtitle,
    AppLocalizations.of(context)!.turnOnLocationSubtitle,
  ];
}

List<String> firstButtonTexts(BuildContext context) {
  return [
    AppLocalizations.of(context)!.all,
    AppLocalizations.of(context)!.burger,
    AppLocalizations.of(context)!.pizza,
    AppLocalizations.of(context)!.sandwich,
  ];
}

List<String> secondButtonTexts(BuildContext context) {
  return [
    AppLocalizations.of(context)!.skip, 
    '', 
    '', 
    AppLocalizations.of(context)!.cancel, 
  ];
}
final List<String> stackImages = [
  "assets/images/onboarding/pattern.png",
  "assets/images/onboarding/pattern.png",
  "assets/images/onboarding/pattern.png",
  "assets/images/onboarding/maps.png",
];

final List<String> onboardingImages = [
  "assets/images/onboarding/order-food-pana.png",
  "assets/images/onboarding/take-away-cuate.png",
  "assets/images/onboarding/take-away-cuate.png",
  "assets/images/onboarding/take-away-cuate.png",
];

// قائمة قيم الـ top
final List<double> topPositions = [100, 150, 150, 150];

// قائمة عرض الصور
final List<double> imageWidths = [328, 328.5, 328.5, 328.5];

// قائمة ارتفاع الصور
final List<double> imageHeights = [328, 319, 319, 319];
