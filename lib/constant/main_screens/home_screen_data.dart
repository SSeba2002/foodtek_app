import 'package:flutter/material.dart';

import 'package:foodtek_project/l10n/generated/app_localizations.dart';
import 'package:foodtek_project/model/category_model.dart';

List<Category> items(BuildContext context) {
  return [
    Category(
      title: AppLocalizations.of(context)!.chickenBurger,
      image: "assets/images/home/top_rated/chicken_burger.png",
      description: AppLocalizations.of(context)!.chickenBurgerDesc,
      price: "\$20.00",
      rating: 0,
      id: 1, 
    ),
    Category(
      title: AppLocalizations.of(context)!.cheeseBurger,
      image: "assets/images/home/top_rated/chese_burger.png",
      description: "lzzhxcskldbvkj'adljjsvh",
      price: "\$15.00",
      rating: 0,
      id: 2, 
    ),
    Category(
      title: AppLocalizations.of(context)!.spicyShawarma,
      image: "assets/images/home/top_rated/chese_burger.png",
      description: "lhuvhjn,kjbhvgb.akhuj",
      price: "\$15.00",
      rating: 0,
      id: 3, 
    ),
    Category(
      title: AppLocalizations.of(context)!.onionPizza,
      image: "assets/images/home/top_rated/chese_burger.png",
      description: AppLocalizations.of(context)!.pizzaDesc,
      price: "\$29.00",
      rating: 0,
      id: 4, 
    ),
    Category(
      title: "Cheese Pizza",
      image: "assets/images/home/top_rated/chese_burger.png",
      description: "Margarita-style pizza with fresh mozzarella",
      price: "\$23.00",
      rating: 0,
      id: 5, 
    ),
    Category(
      title: "Mexican Green Pizza",
      image: "assets/images/home/top_rated/chese_burger.png",
      description:
          "A pizza loaded with crunchy onions, crisp capsicum, juicy tomatoes",
      price: "\$23.00",
      rating: 0,
      id: 6, 
    ),
    Category(
      title: "Peppy Paneer Pizza",
      image: "assets/images/home/top_rated/chese_burger.png",
      description: "Chunky paneer with crisp capsicum and spicy red pepper",
      price: "\$13.00",
      rating: 0,
      id: 7, 
    ),
  ];
}

// Top Rated Items
List<Category> topRatedItems(BuildContext context) {
  return [
    Category(
      title: AppLocalizations.of(context)!.chickenBurger,
      image: "assets/images/home/top_rated/chicken_burger.png",

      description: AppLocalizations.of(context)!.chickenBurgerDesc,
      price: "\$20.00",
      rating: 3.8,
      id: 1, 
    ),
    Category(
      title: AppLocalizations.of(context)!.cheeseBurger,
      image: "assets/images/home/top_rated/chese_burger.png",
      description: AppLocalizations.of(context)!.cheeseBurgerDesc,
      price: "\$15.00",
      rating: 4.5,
      id: 2, 
    ),
    Category(
      title: AppLocalizations.of(context)!.chickenBurger,
      image: "assets/images/home/top_rated/chese_burger.png",
      description: AppLocalizations.of(context)!.cheeseBurgerDesc,
      price: "\$20.00",
      rating: 3.9,
      id: 11, 
    ),
  ];
}

// Recommended Items
final List<Category> recommendedItems = [
  Category(
    title: "Sushi Platter",
    image: "assets/images/home/cupcake.png",
    description: "",
    price: "\$103.00",
    rating: 0,
    id: 10, 
  ),
  Category(
    title: "Curry",
    image: "assets/images/home/curry.png",
    description: "",
    price: "\$50.0",
    rating: 0,
    id: 22, 
  ),
  Category(
    title: "Grilled Steak",
    image: "assets/images/home/pasta.png",
    description: "",
    price: "\$12.99",
    rating: 0,
    id: 25, 
  ),
  Category(
    title: "Cupcake",
    image: "assets/images/home/sushi.png",

    description: "",
    price: "\$8.20",
    rating: 0,
    id: 27,
  ),
];

// Categories
List<String> categories(BuildContext context) {
  return [
    AppLocalizations.of(context)!.all,
    AppLocalizations.of(context)!.burger,
    AppLocalizations.of(context)!.pizza,
    AppLocalizations.of(context)!.sandwich,
  ];
}

String selectedCategory = "All";

// Unified List of All Items
List<Category> allItems(BuildContext context) {
  return [...topRatedItems(context), ...recommendedItems, ...items(context)];
}