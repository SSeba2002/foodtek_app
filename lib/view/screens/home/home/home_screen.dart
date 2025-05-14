import 'package:flutter/material.dart';
import 'package:foodtek_project/constant/main_screens/home_screen_data.dart';
import 'package:foodtek_project/data/cart_item_list.dart';
import 'package:foodtek_project/l10n/generated/app_localizations.dart';
import 'package:foodtek_project/model/cart_item_model.dart';
import 'package:foodtek_project/model/category_model.dart';
import 'package:foodtek_project/view/screens/home/home/item_details_screen.dart';
import 'package:foodtek_project/view/widgets/home/banner_widget.dart';
import 'package:foodtek_project/view/widgets/home/category_cell.dart';
import 'package:foodtek_project/view/widgets/home/view_all_title.dart';
import 'package:foodtek_project/view/widgets/main_page/location_search_widget.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek_project/cubit/top_rated/top_rated_state.dart';
import 'package:foodtek_project/cubit/top_rated/top_rated_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? selectedCategory;
  TextEditingController txtSearch = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<TopRatedCubit>().fetchTopRatedItems();
  }

  @override
  Widget build(BuildContext context) {
    List<Category> filteredItems =
        selectedCategory == null || selectedCategory == "All"
            ? allItems(context)
            : allItems(
              context,
            ).where((item) => item.title.contains(selectedCategory!)).toList();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            LocationNotificationSrearch(showSearchBar: true),
            const SizedBox(height: 15),
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories(context).length,
                itemBuilder: (context, index) {
                  bool isSelected =
                      selectedCategory == categories(context)[index] ||
                      (categories(context)[index] ==
                              AppLocalizations.of(context)!.all &&
                          selectedCategory == null);

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
                            categories(context)[index] ==
                                    AppLocalizations.of(context)!.all
                                ? null
                                : categories(context)[index];
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.green),
                        color: isSelected ? Colors.green[400] : null,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          if (categoryIcons[categories(context)[index]]!
                              .isNotEmpty) ...[
                            Text(
                              categoryIcons[categories(context)[index]]!,
                              style: const TextStyle(fontSize: 16),
                            ),
                            const SizedBox(width: 5),
                          ],
                          Text(
                            categories(context)[index],
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            if (selectedCategory == null) ...[
              const PromoBanner(),
              const SizedBox(height: 20),
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
                  child: BlocBuilder<TopRatedCubit, TopRatedState>(
                    builder: (context, state) {
                      if (state is TopRatedLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is TopRatedLoaded) {
                        final items = state.items;
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            final item = items[index];
                            final isArabic =
                                Localizations.localeOf(context).languageCode ==
                                'ar';

                            return CategoryCell(
                              onAddTap: () {
                                cartItems(
                                  context,
                                ).add(CartItem.fromTopRatedItem(item));
                                setState(() {});
                              },
                              isRecommended: false,
                              cObj:
                                  isArabic
                                      ? item.nameAr ?? ''
                                      : item.nameEn ?? '',
                              image: item.image ?? '',
                              price: item.price?.toString() ?? '',
                              rating: item.itemRate ?? 0.0,
                              description:
                                  isArabic
                                      ? item.descriptionAr ?? ''
                                      : item.descriptionEn ?? '',
                              onTap: () {
                                PersistentNavBarNavigator.pushNewScreen(
                                  context,
                                  screen: ItemDetailsScreen(
                                    name:
                                        isArabic
                                            ? item.nameAr ?? ''
                                            : item.nameEn ?? '',
                                    image: item.image ?? '',
                                    price: item.price?.toString() ?? '',
                                    description:
                                        isArabic
                                            ? item.descriptionAr ?? ''
                                            : item.descriptionEn ?? '',
                                    rating: item.itemRate ?? 0.0,
                                    id: item.id ?? 0,
                                  ),
                                  withNavBar: false,
                                  pageTransitionAnimation:
                                      PageTransitionAnimation.cupertino,
                                );
                              },
                            );
                          },
                        );
                      } else if (state is TopRatedError) {
                        return Center(child: Text(state.message));
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ViewAllTitleRow(
                  title: AppLocalizations.of(context)!.recommend,
                  onView: () {},
                  vis: true,
                ),
              ),
          
            ],
          ],
        ),
      ),
    );
  }
}
