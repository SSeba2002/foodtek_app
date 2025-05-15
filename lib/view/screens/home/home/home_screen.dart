import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek_project/constant/main_screens/home_screen_data.dart';
import 'package:foodtek_project/cubit/recommended_item/recommended_item_cubit.dart';
import 'package:foodtek_project/cubit/recommended_item/recommended_item_state.dart';
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

import '../../../../cubit/home/get_all_category_cubit.dart';
import '../../../../state/home/get_all_category_state.dart';


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
    context.read<RecommendedItemCubit>().loadRecommendedItems();
  }

  @override
  Widget build(BuildContext context) {
    List<Category> filteredItems = selectedCategory == null || selectedCategory == "All"
        ? allItems(context)
        : allItems(context).where((item) => item.title.contains(selectedCategory!)).toList();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            LocationNotificationSrearch(showSearchBar: true),
            const SizedBox(height: 15),


            BlocBuilder<CategoryCubit, CategoryState>(
              builder: (context, state) {
                if (state is CategoryLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is CategoryLoaded) {
                  final tabs = state.categories;

                  return SizedBox(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: tabs.length,
                      itemBuilder: (context, index) {
                        final category = tabs[index];
                        final locale = Localizations.localeOf(context).languageCode;
                        final isArabic = locale == 'ar';
                        final categoryName = isArabic ? category.nameAr : category.nameEn;

                        final isSelected = selectedCategory == categoryName ||
                            (categoryName == AppLocalizations.of(context)!.all &&
                                selectedCategory == null);

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedCategory = categoryName == AppLocalizations.of(context)!.all
                                  ? null
                                  : categoryName;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.green),
                              color: isSelected ? Colors.green[400] : null,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              children: [
                                if (category.image!.isNotEmpty) ...[
                                  Image.network(
                                    category.image!,
                                    width: 24,
                                    height: 24,
                                    errorBuilder: (context, error, stackTrace) => SizedBox(),
                                  ),
                                  const SizedBox(width: 5),
                                ],
                                Text(
                                  categoryName!,
                                  style: const TextStyle(fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                } else if (state is CategoryError) {
                  return Center(child: Text('Error: ${state.message}'));
                } else {
                  return const SizedBox();
                }
              },

            ),

            const SizedBox(height: 20),
            BlocBuilder<RecommendedItemCubit, RecommendedItemState>(
              builder: (context, state) {
                if (state is RecommendedItemLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is RecommendedItemLoaded) {
                  final recommendedItems = state.items;
                  final locale = AppLocalizations.of(context)!.localeName;


                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: ViewAllTitleRow(
                          title: AppLocalizations.of(context)!.recommend,
                          onView: () {},
                          vis: true,
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 300,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: recommendedItems.length,
                          itemBuilder: (context, index) {
                            final item = recommendedItems[index];
                            final title = locale == 'ar' ? item.nameAr : item.nameEn;
                            final description =
                                locale == 'ar' ? item.descriptionAr : item.descriptionEn;

                            return CategoryCell(
                              onAddTap: () {},
                              isRecommended: true,
                              price: item.price?.toString() ?? '',
                              description: description,
                              cObj: title,
                              onTap: () {
                                PersistentNavBarNavigator.pushNewScreen(
                                  context,
                                  screen: ItemDetailsScreen(
                                    name: title,
                                    image: item.image ?? '',
                                    price: item.price?.toString() ?? '',
                                    description: description,
                                    rating: 4.5,
                                    id: item.id,
                                  ),
                                  withNavBar: true,
                                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                                );
                              },
                              image: item.image ?? '',
                            );
                          },
                        ),
                      ),
                    ],
                  );
                } else if (state is RecommendedItemError) {
                  return Center(child: Text(state.message));
                }
                return const SizedBox.shrink();
              },
            ),

            if (selectedCategory == null) ...[
              PromoBanner(),
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
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: topRatedItems(context).length,
                    itemBuilder: (context, index) {
                      return CategoryCell(
                        onAddTap: () {
                          cartItems(context).add(topRatedItems(context)[index] as CartItem );
                          setState(() {});
                        },
                        isRecommended: false,
                        cObj: topRatedItems(context)[index].title,
                        image: topRatedItems(context)[index].image,
                        price: topRatedItems(context)[index].price,
                        rating: topRatedItems(context)[index].rating,
                        description: topRatedItems(context)[index].description,
                        onTap: () {
                          PersistentNavBarNavigator.pushNewScreen(
                            context,
                            screen: ItemDetailsScreen(
                              name: topRatedItems(context)[index].title,
                              image: topRatedItems(context)[index].image,
                              price: topRatedItems(context)[index].price,
                              description: topRatedItems(context)[index].description,
                              rating: topRatedItems(context)[index].rating,
                              id: topRatedItems(context)[index].id,
                            ),
                            withNavBar: false,
                            pageTransitionAnimation: PageTransitionAnimation.cupertino,
                          );
                        },
                      );
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
                          pageTransitionAnimation: PageTransitionAnimation.cupertino,
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
