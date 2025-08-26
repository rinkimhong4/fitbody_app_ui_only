import 'package:fitbody_app_ui/modules/auth/forgot/forgot_pwd.dart';
import 'package:fitbody_app_ui/modules/auth/forgot/set_new_pwd.dart';
import 'package:fitbody_app_ui/modules/auth/signin/sign_in.dart';
import 'package:fitbody_app_ui/modules/auth/signup/sign_up.dart';
import 'package:fitbody_app_ui/modules/home/views/notification/notification_screen.dart';
import 'package:fitbody_app_ui/modules/home/views/profile/profile_screen.dart';
import 'package:fitbody_app_ui/modules/home/views/search/search_screen.dart';
import 'package:fitbody_app_ui/modules/items/profile_items/edit_profile_screen.dart';
import 'package:fitbody_app_ui/modules/items/profile_items/favorite_profile_screen.dart';
import 'package:fitbody_app_ui/modules/items/profile_items/help_profile_screen.dart';
import 'package:fitbody_app_ui/modules/items/profile_items/privacy_policy_screen.dart';
import 'package:fitbody_app_ui/modules/items/profile_items/setting_profile_screen.dart';
import 'package:fitbody_app_ui/modules/items/recommnt/recommnt_screen.dart';
import 'package:fitbody_app_ui/modules/items/settings/delete_account_setting.dart';
import 'package:fitbody_app_ui/modules/items/settings/notification_setting.dart';
import 'package:fitbody_app_ui/modules/items/settings/password_setting.dart';
import 'package:fitbody_app_ui/modules/items/top_menu_home/Community/community_screen.dart';
import 'package:fitbody_app_ui/modules/items/top_menu_home/Nutrition/meal_plans.dart';
import 'package:fitbody_app_ui/modules/items/top_menu_home/Nutrition/nutrition_screen.dart';
import 'package:fitbody_app_ui/modules/items/top_menu_home/Progresstracking/progress_tracking.dart';
import 'package:fitbody_app_ui/modules/items/top_menu_home/work_out/work_out_list_screen.dart';
import 'package:fitbody_app_ui/modules/items/top_menu_home/work_out/work_out_screen.dart';
import 'package:fitbody_app_ui/widgets/main_navigation.dart';
import 'package:fitbody_app_ui/modules/home/views/setup/set_up_activity_level.dart';
import 'package:fitbody_app_ui/modules/home/views/setup/set_up_gender.dart';
import 'package:fitbody_app_ui/modules/home/views/setup/set_up_goal.dart';
import 'package:fitbody_app_ui/modules/home/views/setup/set_up_height.dart';
import 'package:fitbody_app_ui/modules/home/views/setup/set_up_old.dart';
import 'package:fitbody_app_ui/modules/home/views/setup/set_up_profile.dart';
import 'package:fitbody_app_ui/modules/home/views/setup/set_up_screen.dart';
import 'package:fitbody_app_ui/modules/home/views/setup/set_up_weight.dart';
import 'package:fitbody_app_ui/modules/home/views/splash/onboarding_screen.dart';
import 'package:fitbody_app_ui/modules/home/views/splash/splash_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

class AppRoute {
  static const String splash = '/splash';
  static const String home = '/home';
  static const String onboarding = '/onboarding';
  static const String signin = '/signin';
  static const String signup = '/signup';
  static const String forgotPwd = '/forgotPwd';
  static const String setNewPwd = '/setNewPwd';
  static const String setUpScreen = '/setUpScreen';
  static const String setUpGender = '/setUpGender';
  static const String setUpOld = '/setUpOld';
  static const String setUpWeight = '/setUpWeight';
  static const String setUpHeight = '/setUpHeight';
  static const String setUpGoal = '/setUpGoal';
  static const String setUpActivityLevel = '/setUpActivityLevel';
  static const String setUpProfile = '/setUpProfile';
  static const String profileScreen = '/profileScreen';
  static const String editProfileScreen = '/editProfileScreen';
  static const String favoriteProfileScreen = '/favoriteProfileScreen';
  static const String settingProfileScreen = '/settingProfileScreen';
  static const String deleteAccountSetting = '/deleteAccountSetting';
  static const String notificationSetting = '/notificationSetting';
  static const String passwordSetting = '/passwordSetting';
  static const String privacyPolicyScreen = '/privacyPolicyScreen';
  static const String helpProfileScreen = '/helpProfileScreen';
  static const String notificationScreen = '/notificationScreen';
  static const String searchScreen = '/searchScreen';
  static const String workOutScreen = '/workOutScreen';
  static const String workOutListScreen = '/workOutListScreen';
  static const String progressTracking = '/progressTracking';
  static const String nutritionScreen = '/nutritionScreen';
  static const String communityScreen = '/communityScreen';
  static const String mealPlansDetails = '/mealPlansDetails';
  static const String recommntScreen = '/recommntScreen';

  static final pages = [
    GetPage(
      name: home,
      // page: () => HomeScreen(),
      page: () => MainNavigationScreen(),
      // transition: Transition.fadeIn,
      // transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: privacyPolicyScreen,
      // page: () => HomeScreen(),
      page: () => PrivacyPolicyScreen(),
      // transition: Transition.fadeIn,
      // transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: recommntScreen,
      // page: () => HomeScreen(),
      page: () => RecommntScreen(),
      // transition: Transition.fadeIn,
      // transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: mealPlansDetails,
      // page: () => HomeScreen(),
      page: () => MealPlansDetails(),
      // transition: Transition.fadeIn,
      // transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: communityScreen,
      // page: () => HomeScreen(),
      page: () => CommunityScreen(),
      // transition: Transition.fadeIn,
      // transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: nutritionScreen,
      // page: () => HomeScreen(),
      page: () => NutritionScreen(),
      // transition: Transition.fadeIn,
      // transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: progressTracking,
      // page: () => HomeScreen(),
      page: () => ProgressTracking(),
      // transition: Transition.fadeIn,
      // transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: workOutListScreen,
      // page: () => HomeScreen(),
      page: () => WorkOutListScreen(),
      // transition: Transition.fadeIn,
      // transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: workOutScreen,
      // page: () => HomeScreen(),
      page: () => WorkOutScreen(),
      // transition: Transition.fadeIn,
      // transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: searchScreen,
      // page: () => HomeScreen(),
      page: () => SearchScreen(),
      // transition: Transition.fadeIn,
      // transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: notificationScreen,
      // page: () => HomeScreen(),
      page: () => NotificationScreen(),
      // transition: Transition.fadeIn,
      // transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: helpProfileScreen,
      // page: () => HomeScreen(),
      page: () => HelpProfileScreen(),
      // transition: Transition.fadeIn,
      // transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: setUpProfile,
      page: () => SetUpProfile(),
      // transition: Transition.fadeIn,
      // transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: notificationSetting,
      page: () => NotificationSetting(),
      // transition: Transition.fadeIn,
      // transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: passwordSetting,
      page: () => PasswordSetting(),
      // transition: Transition.fadeIn,
      // transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: deleteAccountSetting,
      page: () => DeleteAccountSetting(),
      // transition: Transition.fadeIn,
      // transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: settingProfileScreen,
      page: () => SettingProfileScreen(),
      // transition: Transition.fadeIn,
      // transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: favoriteProfileScreen,
      page: () => FavoriteProfileScreen(),
      // transition: Transition.fadeIn,
      // transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: editProfileScreen,
      page: () => EditProfileScreen(),
      // transition: Transition.fadeIn,
      // transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: profileScreen,
      page: () => ProfileScreen(),
      // transition: Transition.fadeIn,
      // transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: signin,
      page: () => SignInScreen(),
      transition: Transition.leftToRightWithFade,
      // transitionDuration: Duration(milliseconds: 300),
    ),
    GetPage(
      name: signup,
      page: () => SignUpScreen(),
      transition: Transition.rightToLeftWithFade,
      // transitionDuration: Duration(milliseconds: 300),
    ),
    GetPage(
      name: splash,
      page: () => SplashScreen(),
      // transition: Transition.fadeIn,
      // transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: onboarding,
      page: () => OnboardingScreen(),
      // transition: Transition.fadeIn,
      // transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: forgotPwd,
      page: () => ForgotPwd(),
      // transition: Transition.fade,
      transitionDuration: Duration(milliseconds: 300),
    ),
    GetPage(
      name: setNewPwd,
      page: () => SetNewPwd(),
      // transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 300),
    ),
    GetPage(
      name: setUpScreen,
      page: () => SetUpScreen(),
      // transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 300),
    ),
    GetPage(
      name: setUpGender,
      page: () => SetUpGender(),
      // transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 300),
    ),
    GetPage(
      name: setUpOld,
      page: () => SetUpOld(),
      // transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 300),
    ),
    GetPage(
      name: setUpWeight,
      page: () => SetUpWeight(),
      // transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 300),
    ),
    GetPage(
      name: setUpHeight,
      page: () => SetUpHeight(),
      // transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 300),
    ),
    GetPage(
      name: setUpGoal,
      page: () => SetUpGoal(),
      // transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 300),
    ),
    GetPage(
      name: setUpActivityLevel,
      page: () => SetUpActivityLevel(),
      // transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 300),
    ),
  ];
}
