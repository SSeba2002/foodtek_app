import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek_project/constant/api_constants.dart';
import 'package:foodtek_project/constant/theme.dart';
import 'package:foodtek_project/cubit/offer/offer_cubit.dart';
import 'package:foodtek_project/cubit/offer/offer_state.dart';
import 'package:foodtek_project/l10n/generated/app_localizations.dart';
import 'package:foodtek_project/model/offer_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PromoBanner extends StatefulWidget {
  const PromoBanner({super.key});

  @override
  State<PromoBanner> createState() => _PromoBannerState();
}

class _PromoBannerState extends State<PromoBanner> {
  int currentIndex = 0;

  final CarouselSliderController _carouselController =
      CarouselSliderController(); // Carousel Controller

  @override
  void initState() {
    super.initState();
    context.read<OfferCubit>().getOffers();
  }

  @override
  Widget build(BuildContext context) {
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';

    return BlocBuilder<OfferCubit, OfferState>(
      builder: (context, state) {
        if (state is OfferLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is OfferError) {
          return Center(child: Text(state.message));
        } else if (state is OfferLoaded) {
          final List<OfferModel> offers = state.offers;

          return Column(
            children: [
              CarouselSlider.builder(
                itemCount: offers.length,
                carouselController: _carouselController,
                options: CarouselOptions(
                  height: 180,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.9,
                  onPageChanged: (index, reason) {
                    setState(() => currentIndex = index);
                  },
                ),
                itemBuilder: (context, index, realIndex) {
                  final offer = offers[index];
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          spreadRadius: 2,
                          color: Colors.grey.shade300,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor.withOpacity(0.9),
                              borderRadius: const BorderRadius.horizontal(
                                left: Radius.circular(15),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  isArabic ? offer.titleAr : offer.titleEn,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  isArabic
                                      ? offer.descriptionAr
                                      : offer.descriptionEn,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        ClipRRect(
                          borderRadius: const BorderRadius.horizontal(
                            right: Radius.circular(15),
                          ),

                          child: Image.network(
                            '${ApiConstants.uploadBaseUrl}${offer.image}',
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: 180,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => Image.asset(
                            'assets/images/home/sushi.png',
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: 180,
                            fit: BoxFit.cover,
                            ),
                            ),//  // default image
                        
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 10),
              AnimatedSmoothIndicator(
                activeIndex: currentIndex,
                count: offers.length,
                effect: ExpandingDotsEffect(
                  dotWidth: 7,
                  dotHeight: 7,
                  spacing: 10,
                  activeDotColor: AppColors.primaryColor,
                ),
                onDotClicked: (index) {
                  _carouselController.animateToPage(index);
                },
              ),
            ],
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
