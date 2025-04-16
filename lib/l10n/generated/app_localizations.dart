import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @splashTitle.
  ///
  /// In en, this message translates to:
  /// **'Foodtek'**
  String get splashTitle;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome To Foodtek'**
  String get welcome;

  /// No description provided for @welcomeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enjoy a Fast And Smooth Food Delivery At Your Doorstep'**
  String get welcomeSubtitle;

  /// No description provided for @getDelivery.
  ///
  /// In en, this message translates to:
  /// **'Get Delivery On Time'**
  String get getDelivery;

  /// No description provided for @getDeliverySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Order Your Favorite Food Within The Palm Of Your Hand And The Zone Of Your Comfort'**
  String get getDeliverySubtitle;

  /// No description provided for @chooseFood.
  ///
  /// In en, this message translates to:
  /// **'Choose Your Food'**
  String get chooseFood;

  /// No description provided for @chooseFoodSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Order Your Favorite Food Within The Palm Of Your Hand And The Zone Of Your Comfort'**
  String get chooseFoodSubtitle;

  /// No description provided for @turnOnLocation.
  ///
  /// In en, this message translates to:
  /// **'Turn On Your Location'**
  String get turnOnLocation;

  /// No description provided for @turnOnLocationSubtitle.
  ///
  /// In en, this message translates to:
  /// **'To Continue, Let Your Device Turn On Location, Which Uses Google’s Location Service'**
  String get turnOnLocationSubtitle;

  /// No description provided for @turnOn.
  ///
  /// In en, this message translates to:
  /// **'Yes, Turn it On'**
  String get turnOn;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @signup.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get signup;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @rememberMe.
  ///
  /// In en, this message translates to:
  /// **'Remember me'**
  String get rememberMe;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgotPassword;

  /// No description provided for @continueWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Continue with Google'**
  String get continueWithGoogle;

  /// No description provided for @continueWithFacebook.
  ///
  /// In en, this message translates to:
  /// **'Continue with Facebook'**
  String get continueWithFacebook;

  /// No description provided for @continueWithApple.
  ///
  /// In en, this message translates to:
  /// **'Continue with Apple'**
  String get continueWithApple;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullName;

  /// No description provided for @dob.
  ///
  /// In en, this message translates to:
  /// **'Date of Birth'**
  String get dob;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNumber;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @resetPassword.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get resetPassword;

  /// No description provided for @newPassword.
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get newPassword;

  /// No description provided for @confirmNewPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm New Password'**
  String get confirmNewPassword;

  /// No description provided for @updatePassword.
  ///
  /// In en, this message translates to:
  /// **'Update Password'**
  String get updatePassword;

  /// No description provided for @congrats.
  ///
  /// In en, this message translates to:
  /// **'Congratulations!'**
  String get congrats;

  /// No description provided for @passwordResetSuccess.
  ///
  /// In en, this message translates to:
  /// **'Password reset successfully'**
  String get passwordResetSuccess;

  /// No description provided for @deliveredOrder.
  ///
  /// In en, this message translates to:
  /// **'Delivered Order'**
  String get deliveredOrder;

  /// No description provided for @promotionalOrder.
  ///
  /// In en, this message translates to:
  /// **'Promotional Offer'**
  String get promotionalOrder;

  /// No description provided for @filter.
  ///
  /// In en, this message translates to:
  /// **'Filter'**
  String get filter;

  /// No description provided for @addToCart.
  ///
  /// In en, this message translates to:
  /// **'Add To Cart'**
  String get addToCart;

  /// No description provided for @min.
  ///
  /// In en, this message translates to:
  /// **'Min'**
  String get min;

  /// No description provided for @max.
  ///
  /// In en, this message translates to:
  /// **'Max'**
  String get max;

  /// No description provided for @category.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get category;

  /// No description provided for @applyFilter.
  ///
  /// In en, this message translates to:
  /// **'Apply Filter'**
  String get applyFilter;

  /// No description provided for @continueText.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueText;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @setLocation.
  ///
  /// In en, this message translates to:
  /// **'Set Location'**
  String get setLocation;

  /// No description provided for @checkout.
  ///
  /// In en, this message translates to:
  /// **'Checkout'**
  String get checkout;

  /// No description provided for @payWith.
  ///
  /// In en, this message translates to:
  /// **'Pay With:'**
  String get payWith;

  /// No description provided for @promoCode.
  ///
  /// In en, this message translates to:
  /// **'Promo Code?'**
  String get promoCode;

  /// No description provided for @enterPromo.
  ///
  /// In en, this message translates to:
  /// **'Enter Promo here'**
  String get enterPromo;

  /// No description provided for @card.
  ///
  /// In en, this message translates to:
  /// **'Card'**
  String get card;

  /// No description provided for @cash.
  ///
  /// In en, this message translates to:
  /// **'Cash'**
  String get cash;

  /// No description provided for @cardType.
  ///
  /// In en, this message translates to:
  /// **'Card Type:'**
  String get cardType;

  /// No description provided for @subTotal.
  ///
  /// In en, this message translates to:
  /// **'Sub-Total'**
  String get subTotal;

  /// No description provided for @cart.
  ///
  /// In en, this message translates to:
  /// **'Cart'**
  String get cart;

  /// No description provided for @onionPizza.
  ///
  /// In en, this message translates to:
  /// **'Onion Pizza'**
  String get onionPizza;

  /// No description provided for @spicyShawarma.
  ///
  /// In en, this message translates to:
  /// **'Spicy Shawarma'**
  String get spicyShawarma;

  /// No description provided for @loadMore.
  ///
  /// In en, this message translates to:
  /// **'Load More…'**
  String get loadMore;

  /// No description provided for @cartEmpty.
  ///
  /// In en, this message translates to:
  /// **'Cart Empty'**
  String get cartEmpty;

  /// No description provided for @cartEmptyMsg.
  ///
  /// In en, this message translates to:
  /// **'You don’t have any foods in cart at this time'**
  String get cartEmptyMsg;

  /// No description provided for @historyEmpty.
  ///
  /// In en, this message translates to:
  /// **'History Empty'**
  String get historyEmpty;

  /// No description provided for @historyEmptyMsg.
  ///
  /// In en, this message translates to:
  /// **'You don’t have order any foods before'**
  String get historyEmptyMsg;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @deliveryCharge.
  ///
  /// In en, this message translates to:
  /// **'Delivery Charge'**
  String get deliveryCharge;

  /// No description provided for @discount.
  ///
  /// In en, this message translates to:
  /// **'Discount'**
  String get discount;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total:'**
  String get total;

  /// No description provided for @placeOrder.
  ///
  /// In en, this message translates to:
  /// **'Place My Order'**
  String get placeOrder;

  /// No description provided for @addCard.
  ///
  /// In en, this message translates to:
  /// **'Add Card'**
  String get addCard;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @cardNumber.
  ///
  /// In en, this message translates to:
  /// **'Card Number'**
  String get cardNumber;

  /// No description provided for @expiry.
  ///
  /// In en, this message translates to:
  /// **'Expiry'**
  String get expiry;

  /// No description provided for @cvv.
  ///
  /// In en, this message translates to:
  /// **'CVV'**
  String get cvv;

  /// No description provided for @payForOrder.
  ///
  /// In en, this message translates to:
  /// **'Pay for the order'**
  String get payForOrder;

  /// No description provided for @orderSuccess.
  ///
  /// In en, this message translates to:
  /// **'Your Order Done Successfully'**
  String get orderSuccess;

  /// No description provided for @orderNote.
  ///
  /// In en, this message translates to:
  /// **'you will get your order within 12min. thanks for using our services'**
  String get orderNote;

  /// No description provided for @trackOrder.
  ///
  /// In en, this message translates to:
  /// **'track Your Order'**
  String get trackOrder;

  /// No description provided for @onTheWay.
  ///
  /// In en, this message translates to:
  /// **'On The Way'**
  String get onTheWay;

  /// No description provided for @orderPicked.
  ///
  /// In en, this message translates to:
  /// **'Courier Picked'**
  String get orderPicked;

  /// No description provided for @chat.
  ///
  /// In en, this message translates to:
  /// **'Chat'**
  String get chat;

  /// No description provided for @orderDetails.
  ///
  /// In en, this message translates to:
  /// **'Order Details'**
  String get orderDetails;

  /// No description provided for @orderReceived.
  ///
  /// In en, this message translates to:
  /// **'Order received'**
  String get orderReceived;

  /// No description provided for @cookingOrder.
  ///
  /// In en, this message translates to:
  /// **'Cooking your order'**
  String get cookingOrder;

  /// No description provided for @courierPicking.
  ///
  /// In en, this message translates to:
  /// **'Courier is picking up order'**
  String get courierPicking;

  /// No description provided for @orderDelivered.
  ///
  /// In en, this message translates to:
  /// **'Order delivered'**
  String get orderDelivered;

  /// No description provided for @seaFood.
  ///
  /// In en, this message translates to:
  /// **'Sea Food'**
  String get seaFood;

  /// No description provided for @dessert.
  ///
  /// In en, this message translates to:
  /// **'Dessert'**
  String get dessert;

  /// No description provided for @fastFood.
  ///
  /// In en, this message translates to:
  /// **'Fast Food'**
  String get fastFood;

  /// No description provided for @location.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get location;

  /// No description provided for @dish.
  ///
  /// In en, this message translates to:
  /// **'Dish'**
  String get dish;

  /// No description provided for @spicyCrabCakes.
  ///
  /// In en, this message translates to:
  /// **'Spicy Crab Cakes'**
  String get spicyCrabCakes;

  /// No description provided for @tunaTartare.
  ///
  /// In en, this message translates to:
  /// **'Tuna Tartare'**
  String get tunaTartare;

  /// No description provided for @seafoodPaella.
  ///
  /// In en, this message translates to:
  /// **'Seafood Paella'**
  String get seafoodPaella;

  /// No description provided for @clamChowder.
  ///
  /// In en, this message translates to:
  /// **'Clam Chowder'**
  String get clamChowder;

  /// No description provided for @misoGlazedCod.
  ///
  /// In en, this message translates to:
  /// **'Miso-Glazed Cod'**
  String get misoGlazedCod;

  /// No description provided for @lobsterThermidor.
  ///
  /// In en, this message translates to:
  /// **'Lobster Thermidor'**
  String get lobsterThermidor;

  /// No description provided for @currentLocation.
  ///
  /// In en, this message translates to:
  /// **'Current location'**
  String get currentLocation;

  /// No description provided for @hotCoolSpot.
  ///
  /// In en, this message translates to:
  /// **'Hot Cool Spot'**
  String get hotCoolSpot;

  /// No description provided for @change.
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get change;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @cardHolderName.
  ///
  /// In en, this message translates to:
  /// **'Card Holder Name'**
  String get cardHolderName;

  /// No description provided for @yourDeliveryHero.
  ///
  /// In en, this message translates to:
  /// **'Your Delivery Hero'**
  String get yourDeliveryHero;

  /// No description provided for @writeYourMessage.
  ///
  /// In en, this message translates to:
  /// **'Write your message'**
  String get writeYourMessage;

  /// No description provided for @orderId.
  ///
  /// In en, this message translates to:
  /// **'Order ID'**
  String get orderId;

  /// No description provided for @liveTrack.
  ///
  /// In en, this message translates to:
  /// **'Live Track'**
  String get liveTrack;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @myAccount.
  ///
  /// In en, this message translates to:
  /// **'My Account'**
  String get myAccount;

  /// No description provided for @personalInfo.
  ///
  /// In en, this message translates to:
  /// **'Personal Information'**
  String get personalInfo;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @setting.
  ///
  /// In en, this message translates to:
  /// **'Setting'**
  String get setting;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @pushNotifications.
  ///
  /// In en, this message translates to:
  /// **'Push Notifications'**
  String get pushNotifications;

  /// No description provided for @promoNotifications.
  ///
  /// In en, this message translates to:
  /// **'Promotional Notifications'**
  String get promoNotifications;

  /// No description provided for @more.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get more;

  /// No description provided for @helpCenter.
  ///
  /// In en, this message translates to:
  /// **'Help Center'**
  String get helpCenter;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Log Out'**
  String get logout;

  /// No description provided for @username.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get username;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @update.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get update;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @favorites.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get favorites;

  /// No description provided for @history.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get history;

  /// No description provided for @dontHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get dontHaveAccount;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get signUp;

  /// No description provided for @alreadyHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get alreadyHaveAccount;

  /// No description provided for @backToLogin.
  ///
  /// In en, this message translates to:
  /// **'Back to login page?'**
  String get backToLogin;

  /// No description provided for @send.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;

  /// No description provided for @enterEmailOrPhone.
  ///
  /// In en, this message translates to:
  /// **'Enter your E-mail or phone and we\'ll send you a link to get back into your account'**
  String get enterEmailOrPhone;

  /// No description provided for @codeSent.
  ///
  /// In en, this message translates to:
  /// **'A 4-digit code has been sent to your email. Please enter it to verify.'**
  String get codeSent;

  /// No description provided for @verify.
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get verify;

  /// No description provided for @tryCurrentPassword.
  ///
  /// In en, this message translates to:
  /// **'Want to try with my current password?'**
  String get tryCurrentPassword;

  /// No description provided for @burger.
  ///
  /// In en, this message translates to:
  /// **'Burger'**
  String get burger;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @pizza.
  ///
  /// In en, this message translates to:
  /// **'Pizza'**
  String get pizza;

  /// No description provided for @sandwich.
  ///
  /// In en, this message translates to:
  /// **'Sandwich'**
  String get sandwich;

  /// No description provided for @searchMenu.
  ///
  /// In en, this message translates to:
  /// **'Search menu, restaurant or etc'**
  String get searchMenu;

  /// No description provided for @promoText.
  ///
  /// In en, this message translates to:
  /// **'Experience our delicious new dish 30% OFF'**
  String get promoText;

  /// No description provided for @topRated.
  ///
  /// In en, this message translates to:
  /// **'Top Rated'**
  String get topRated;

  /// No description provided for @chickenBurger.
  ///
  /// In en, this message translates to:
  /// **'Chicken burger'**
  String get chickenBurger;

  /// No description provided for @chickenBurgerDesc.
  ///
  /// In en, this message translates to:
  /// **'100 gr chicken + tomato + cheese + Lettuce'**
  String get chickenBurgerDesc;

  /// No description provided for @cheeseBurger.
  ///
  /// In en, this message translates to:
  /// **'Cheese burger'**
  String get cheeseBurger;

  /// No description provided for @cheeseBurgerDesc.
  ///
  /// In en, this message translates to:
  /// **'100 gr meat + onion + tomato + Lettuce + cheese'**
  String get cheeseBurgerDesc;

  /// No description provided for @recommend.
  ///
  /// In en, this message translates to:
  /// **'Recommend'**
  String get recommend;

  /// No description provided for @viewAll.
  ///
  /// In en, this message translates to:
  /// **'View All'**
  String get viewAll;

  /// No description provided for @pepperoniPizza.
  ///
  /// In en, this message translates to:
  /// **'Pepperoni pizza'**
  String get pepperoniPizza;

  /// No description provided for @pizzaDesc.
  ///
  /// In en, this message translates to:
  /// **'Pepperoni pizza, Margarita Pizza, Margherita Italian cuisine, Tomato'**
  String get pizzaDesc;

  /// No description provided for @pizzaCheese.
  ///
  /// In en, this message translates to:
  /// **'Pizza Cheese'**
  String get pizzaCheese;

  /// No description provided for @pizzaTags.
  ///
  /// In en, this message translates to:
  /// **'Food, pizza, dish, cuisine, junk food, Fast Food, Flatbread, Ingredient'**
  String get pizzaTags;

  /// No description provided for @peppyPaneer.
  ///
  /// In en, this message translates to:
  /// **'Peppy Paneer'**
  String get peppyPaneer;

  /// No description provided for @peppyPaneerDesc.
  ///
  /// In en, this message translates to:
  /// **'Chunky paneer with crisp capsicum and spicy red pepper'**
  String get peppyPaneerDesc;

  /// No description provided for @mexicanGreenWave.
  ///
  /// In en, this message translates to:
  /// **'Mexican Green Wave'**
  String get mexicanGreenWave;

  /// No description provided for @mexicanGreenWaveDesc.
  ///
  /// In en, this message translates to:
  /// **'A pizza loaded with crunchy onions, crisp capsicum, juicy tomatoes'**
  String get mexicanGreenWaveDesc;

  /// No description provided for @read.
  ///
  /// In en, this message translates to:
  /// **'Read'**
  String get read;

  /// No description provided for @unread.
  ///
  /// In en, this message translates to:
  /// **'Unread'**
  String get unread;

  /// No description provided for @delayedOrder.
  ///
  /// In en, this message translates to:
  /// **'We’re sorry! Your order is running late. New ETA: 10:30 PM. Thanks for your patience!'**
  String get delayedOrder;

  /// No description provided for @promoOffer.
  ///
  /// In en, this message translates to:
  /// **'Craving something delicious? 🍔 Get 20% off on your next order. Use code: YUMMY20.'**
  String get promoOffer;

  /// No description provided for @outForDelivery.
  ///
  /// In en, this message translates to:
  /// **'Your order is on the way! 🚗 Estimated arrival: 15 mins. Stay hungry!'**
  String get outForDelivery;

  /// No description provided for @orderConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Your order has been placed! 🍔 We\'re preparing it now. Track your order live!'**
  String get orderConfirmation;

  /// No description provided for @delivered.
  ///
  /// In en, this message translates to:
  /// **'Enjoy your meal! 🍕 Your order has been delivered. Rate your experience!'**
  String get delivered;

  /// No description provided for @removeFromFavorites.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to remove it from favorites?'**
  String get removeFromFavorites;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @cheeseburgerWendys.
  ///
  /// In en, this message translates to:
  /// **'Cheeseburger Wendy\'s Burger'**
  String get cheeseburgerWendys;

  /// No description provided for @loremDescription.
  ///
  /// In en, this message translates to:
  /// **'Nulla occaecat velit laborum exercitation ullamco. Elit labore eu aute elit nostrud culpa velit excepteur deserunt sunt. Velit non est cillum consequat cupidatat ex Lorem laboris labore aliqua ad duis eu laborum.'**
  String get loremDescription;

  /// No description provided for @spicy.
  ///
  /// In en, this message translates to:
  /// **'Spicy'**
  String get spicy;

  /// No description provided for @quantity.
  ///
  /// In en, this message translates to:
  /// **'Quantity'**
  String get quantity;

  /// No description provided for @mild.
  ///
  /// In en, this message translates to:
  /// **'Mild'**
  String get mild;

  /// No description provided for @hot.
  ///
  /// In en, this message translates to:
  /// **'Hot'**
  String get hot;

  /// No description provided for @track.
  ///
  /// In en, this message translates to:
  /// **'Track'**
  String get track;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
