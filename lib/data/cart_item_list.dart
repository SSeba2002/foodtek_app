import 'package:foodtek_project/l10n/generated/app_localizations.dart';
import 'package:foodtek_project/model/category_model.dart';
import 'package:flutter/material.dart';

List<Category> cartItems(BuildContext context) {
  return [
    Category(
      title: AppLocalizations.of(context)!.spicyChickenBurger,
      image: "assets/images/home/top_rated/chese_burger.png",
      description: AppLocalizations.of(context)!.spicyChickenSandwich,
      price: "\$20.00",
      rating: 3.9,
      id: 11,
    ),
  ];
}
