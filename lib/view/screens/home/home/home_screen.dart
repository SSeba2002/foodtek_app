import 'package:flutter/material.dart';
import 'package:foodtek_project/constant/main_screens/home_screen_data.dart';
import 'package:foodtek_project/data/cart_item_list.dart';
import 'package:foodtek_project/l10n/generated/app_localizations.dart';

import 'package:foodtek_project/model/category_model.dart';
import 'package:foodtek_project/view/screens/home/home/item_details_screen.dart';
import 'package:foodtek_project/view/widgets/home/banner_widget.dart';
import 'package:foodtek_project/view/widgets/home/category_cell.dart';
import 'package:foodtek_project/view/widgets/home/view_all_title.dart';
import 'package:foodtek_project/view/widgets/main_page/location_search_widget.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? selectedCategory; // Null means nothing is selected
  TextEditingController txtSearch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    List<Category> filteredItems = // to filter the items
        selectedCategory == null || selectedCategory == "All"
            ? allItems
            : allItems
                .where((item) => item.title.contains(selectedCategory!))
                .toList();

    return Scaffold(
      // backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            LocationNotificationSrearch(showSearchBar: true),
            const SizedBox(height: 15),
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  bool isSelected =
                      selectedCategory == categories[index] ||
                      (categories[index] == "All" && selectedCategory == null);

                  // Icons for each category
                  Map<String, String> categoryIcons = {
                    AppLocalizations.of(context)!.all: "",
                    AppLocalizations.of(context)!.burger: "🍔",
                    AppLocalizations.of(context)!.pizza: "🍕",
                    AppLocalizations.of(context)!.sandwich: "🌭",
                  };

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategory =
                            categories[index] == "All"
                                ? null
                                : categories[index];
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.green),
                        color: isSelected ? Colors.green[400] : null,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          if (categoryIcons[categories[index]]!.isNotEmpty) ...[
                            Text(
                              categoryIcons[categories[index]]!,
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(width: 5),
                          ],
                          Text(
                            categories[index],
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            // Show main screen if All is selected
            if (selectedCategory == null) ...[
              PromoBanner(), // Promo banner
              const SizedBox(height: 20),

              // Top Rated
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ViewAllTitleRow(
                  title: AppLocalizations.of(context)!.topRated,
                  onView: () {},
                  vis: false,
                ),
              ),
              SizedBox(
                height: 250,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: topRatedItems.length,
                    itemBuilder: (context, index) {
                      return CategoryCell(
                        onAddTap: () {
                          cartItems.add(topRatedItems[index]);
                          print(
                            "تمت الاضاااافة =============================================${cartItems[0].title}",
                          );
                          setState(() {});
                        },
                        isRecommended: false,
                        cObj: topRatedItems[index].title,
                        image: topRatedItems[index].image,
                        price: topRatedItems[index].price,
                        rating: topRatedItems[index].rating,
                        description: topRatedItems[index].description,
                        onTap: () {
                          PersistentNavBarNavigator.pushNewScreen(
                            context,
                            screen: ItemDetailsScreen(
                              name: topRatedItems[index].title,
                              image: topRatedItems[index].image,
                              price: topRatedItems[index].price,
                              // Example price list
                              description: topRatedItems[index].description,
                              // Example description list
                              rating: topRatedItems[index].rating,
                              id:
                                  topRatedItems[index]
                                      .id, // Example ratings list
                            ),
                            withNavBar:
                                false, // OPTIONAL VALUE. True by default.
                            pageTransitionAnimation:
                                PageTransitionAnimation.cupertino,
                          );
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder:
                          //         (context) => ItemDetailsScreen(
                          //           name: topRatedItems[index].title,
                          //           image: topRatedItems[index].image,
                          //           price: topRatedItems[index].price,
                          //           // Example price list
                          //           description:
                          //               topRatedItems[index].description,
                          //           // Example description list
                          //           rating: topRatedItems[index].rating,
                          //           id:
                          //               topRatedItems[index]
                          //                   .id, // Example ratings list
                          //         ),
                          //   ),
                          // );
                        },
                      );
                    },
                  ),
                ),
              ),

              // Recommended
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ViewAllTitleRow(
                  title: AppLocalizations.of(context)!.recommend,
                  onView: () {},
                  vis: true,
                ),
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: recommendedItems.length,
                  itemBuilder: (context, index) {
                    return CategoryCell(
                      onAddTap: () {},
                      isRecommended: true,
                      price: recommendedItems[index].price,
                      description: '',
                      cObj: '',
                      onTap: () {
                        PersistentNavBarNavigator.pushNewScreen(
                          context,
                          screen: ItemDetailsScreen(
                            name: recommendedItems[index].title,
                            image: recommendedItems[index].image,
                            price: recommendedItems[index].price,

                            description: recommendedItems[index].description,

                            rating: recommendedItems[index].rating,
                            id: recommendedItems[index].id,
                          ),
                          withNavBar: false,
                          pageTransitionAnimation:
                              PageTransitionAnimation.cupertino,
                        );
                      },
                      image: recommendedItems[index].image,
                    );
                  },
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
