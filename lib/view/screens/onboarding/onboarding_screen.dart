import 'package:flutter/material.dart';

import 'package:foodtek_project/constant/theme.dart';
import 'package:foodtek_project/constant/onboarding_data.dart';
import 'package:foodtek_project/view/screens/auth/login_screen.dart';
import 'package:foodtek_project/view/widgets/onboarding/onboarding_widget.dart';
import 'package:geolocator/geolocator.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView.builder(
        controller: pageController,
        onPageChanged: (index) {},
        itemCount: 4,
        itemBuilder: (context, index) {
          return OnboardingWidget(
            stackImage: stackImages[index],
            onBoardingImg: onboardingImages[index],
            top: topPositions[index],
            imageWiddth: imageWidths[index],
            imageheight: imageHeights[index],
            title: onboardingTitles(context)[index],
            description: onboardingDescriptions(context)[index],
            firstButtonText: firstButtonTexts(context)[index],
            onPressedOne: () {
              if (index == 3) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
                // determinePosition().then(
                //   // calles the method to git the location and then it goes to the login screen
                //   await Navigator.pushReplacement(
                //     context,
                //     MaterialPageRoute(builder: (context) => LoginScreen()),
                //   ),
                // );
                // Future.delayed(const Duration(seconds: 3), () {
                //   // so it navigates to the login screen
                //
                // });
              } else {
                // else it continues to the next screen
                pageController.nextPage(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              }
            },
            secondButtonText: secondButtonTexts(context)[index],
            onPressedTwo: () {
              LocationPermission.denied; // does not get the location

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            isVisible: index == 3 ? true : false,
          );
        },
      ),

      bottomSheet: Container(
        height: 60,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: Text("Skip", style: TextStyle(color: Colors.black)),
            ),
            Center(
              // the three dots in the middle
              child: SmoothPageIndicator(
                controller: pageController,
                count: 4,
                effect: WormEffect(
                  dotWidth: 10,
                  dotHeight: 10,
                  spacing: 16,
                  dotColor: Colors.black12,
                  activeDotColor: AppColors.primaryColor,
                ),
                onDotClicked: (index) {
                  pageController.animateToPage(
                    index,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeIn,
                  );
                },
              ),
            ),
            IconButton(
              // to move on page at a time
              onPressed: () {
                pageController.nextPage(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              },
              icon: Icon(Icons.arrow_forward, color: AppColors.primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
