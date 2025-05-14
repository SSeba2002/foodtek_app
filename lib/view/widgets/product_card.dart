import 'package\:flutter/material.dart';
import 'package\:flutter\_bloc/flutter\_bloc.dart';
import 'package\:flutter\_screenutil/flutter\_screenutil.dart';
import 'package\:foodtek\_project/l10n/generated/app\_localizations.dart';
import 'package\:foodtek\_project/model/product\_model.dart';

import '../../cubit/home/favorites/add\_remove\_favorite\_cubit.dart';
import '../../cubit/home/favorites/favorite\_cubit.dart';
import '../../state/home/favorites/add\_remove\_favorite\_state.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onFavoritePressed;
  final VoidCallback onOrderPressed;

  const ProductCard({
    super.key,
    required this.product,
    required this.onFavoritePressed,
    required this.onOrderPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(6.w),
      padding: EdgeInsets.only(bottom: 35.h),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFDBF4D1), width: 1.w),
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
              backgroundImage: NetworkImage(product.imageUrl),
            ),
          ),
        ),
      ),
      Positioned(
        top: -8.h,
        right: -8.w,
        child: BlocConsumer<AddRemoveFavoriteCubit, AddRemoveFavoriteState>(
      listener: (context, state) {
        if (state is AddRemoveFavoriteSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
          context.read<FavoritesCubit>().fetchFavorites();

        } else if (state is AddRemoveFavoriteError) {
        ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(state.errorMessage)),
        );

        }
      },
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            color: const Color(0xFFDBF4D1),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: state is AddRemoveFavoriteLoading
                ? SizedBox(
              width: 18.w,
              height: 18.w,
            )
                : Icon(
              product.isFavorite
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: product.isFavorite ? Colors.red : Colors.black,
              size: 18.w,
            ),
            onPressed: () {
              if (product.isFavorite) {
                context.read<AddRemoveFavoriteCubit>().removeFromFavorite(product.id);
              } else {
                context.read<AddRemoveFavoriteCubit>().addToFavorite(product.id);
              }
              onFavoritePressed();
            },
          ),
        );
      },
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
                  product.name,
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
                      color: Color(0XFFFFAC33),
                      size: 14.w,
                    ),
                    SizedBox(width: 5.w),
                    Expanded(
                      child: Text(
                        product.description,
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
                  product.formattedPrice,
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
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: ElevatedButton(
              onPressed: onOrderPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF25AE4B),
                padding: EdgeInsets.symmetric(
                  horizontal: 8.w,
                  vertical: 6.h,
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
      ),
      ],
    ),
    );


  }
}
