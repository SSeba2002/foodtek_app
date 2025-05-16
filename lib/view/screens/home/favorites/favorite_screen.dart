import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:foodtek_project/l10n/generated/app_localizations.dart';
import 'package:foodtek_project/model/get_favorite_item.dart';

import '../../../../cubit/home/favorites/add_remove_favorite_cubit.dart';
import '../../../../cubit/home/favorites/favorite_cubit.dart';
import '../../../../state/home/favorites/favorite_state.dart';
import '../../../widgets/home/location_widget.dart';
import '../../../widgets/home/notification_icon_widget.dart';
import '../../../widgets/home/search_bar_widget.dart';


class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}


class _FavoritesScreenState extends State<FavoritesScreen> {
  List<GetFavoriteItem> _favoritesList = [];

  @override
  void initState() {
    super.initState();

    context.read<FavoritesCubit>().fetchFavorites();
  }

  void _showRemoveDialog(BuildContext context, GetFavoriteItem item) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: 24.h,
            horizontal: 20.w,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                AppLocalizations.of(context)!.removeFromFavorites,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 20.h),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF25AE4B),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 14.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      _favoritesList.remove(item);
                    });

                    context.read<AddRemoveFavoriteCubit>().removeFromFavorite(item.id.toString());

                    Navigator.of(context).pop();
                  },
                  child: Text(
                    AppLocalizations.of(context)!.yes,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }


  void _navigateToProductDetail(GetFavoriteItem product) {
    debugPrint('${AppLocalizations.of(context)!.tappedOn} ${product.nameEn}');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LocationWidget(),
            NotificationIconWidget(),
            SizedBox(height: 3),
            SearchBarWidget(onFilterPressed: () {}),
            SizedBox(height: 20.h),
            Text(
              AppLocalizations.of(context)!.favorites,
              style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 25.h),
            Expanded(
              child: BlocBuilder<FavoritesCubit, FavoritesState>(
                builder: (context, state) {
                  if (state is FavoritesLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is FavoritesError) {
                    return Center(child: Text(state.message));
                  } else if (state is FavoritesLoaded) {
                    _favoritesList = state.favorites;

                    return GridView.builder(
                      padding: EdgeInsets.zero,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20.w,
                        mainAxisSpacing: 25.h,
                        childAspectRatio: 0.75,
                      ),
                      itemCount: _favoritesList.length,
                      itemBuilder: (context, index) {
                        return _buildProductCard(_favoritesList[index], context);
                      },
                    );
                  }
                  return const Center(child: Text('No favorites yet'));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard(GetFavoriteItem product, BuildContext context) {
    return Container(
      margin: EdgeInsets.all(6.w),
      padding: EdgeInsets.only(bottom: 35.h),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFDBF4D1), width: 1.w),
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -25.h,
            left: 0,
            right: 0,
            child: Center(
              child: CircleAvatar(
                radius: 42.r,
                backgroundColor: Colors.transparent,
                child: CircleAvatar(
                  radius: 38.r,
                  backgroundImage: NetworkImage('https://example.com/image.jpg'),
                ),
              ),
            ),
          ),
          Positioned(
            top: -8.h,
            right: -8.w,
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFDBF4D1),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 18,
                ),
                onPressed: () => _showRemoveDialog(context, product),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 50.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.w),
                    child: Text(
                      product.nameEn ?? 'No name',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.bolt,
                          color: const Color(0XFFFFAC33),
                          size: 14.w,
                        ),
                        SizedBox(width: 5.w),
                        Expanded(
                          child: Text(
                            product.descriptionEn ?? 'No description',
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: Colors.grey,
                              fontWeight: FontWeight.w300,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.w),
                    child: Text(
                      '\$${product.price?.toStringAsFixed(2) ?? '0.00'}',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: -40.h,
            left: 0,
            right: 0,
            child: Center(
              child: ElevatedButton(
                onPressed: () => _navigateToProductDetail(product),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF25AE4B),
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.w,
                    vertical: 6.h,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                ),
                child: Text(
                  AppLocalizations.of(context)!.orderNow,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
