import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitbody_app_ui/config/route/app_route.dart';
import 'package:fitbody_app_ui/config/theme/app_theme.dart';
import 'package:fitbody_app_ui/core/data/home_data.dart';
import 'package:fitbody_app_ui/modules/items/top_menu_home/Nutrition/meal_tdeas.dart';
import 'package:fitbody_app_ui/modules/items/top_menu_home/Nutrition/nutrition_card.dart';
import 'package:fitbody_app_ui/modules/items/top_menu_home/Nutrition/nutrition_meal_plans.dart';
import 'package:fitbody_app_ui/widgets/custom_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';

class NutritionScreen extends StatelessWidget {
  const NutritionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppColors.dark, body: _buildBody(context));
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      color: AppColors.dark,
      child: NestedScrollView(
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [_buildSliverAppBar(context)];
        },
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [_buildTabBarContent(context)],
          ),
        ),
      ),
    );
  }

  _buildSliverAppBar(BuildContext context) {
    List<IconData> iconActions = [
      Icons.search_outlined,
      Icons.notifications_sharp,
      Icons.person,
    ];

    List<VoidCallback> iconActionsCallbacks = [
      () => Get.offAndToNamed(AppRoute.searchScreen),
      () => Get.offAndToNamed(AppRoute.notificationScreen),
      () => Get.offAndToNamed(AppRoute.profileScreen),
    ];
    return SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.dark,
      pinned: true,
      floating: false,
      expandedHeight: 70,
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Icon(
          Icons.arrow_left_sharp,
          color: AppColors.neonYellow,
          size: 38,
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Nutrition',
            style: AppTextStyles.titleMedium.copyWith(
              color: AppColors.primaryPurple,
            ),
          ),
        ],
      ),
      centerTitle: false,
      actions: List.generate(
        iconActions.length,
        (index) => Padding(
          padding: EdgeInsets.only(right: 8),
          child: InkWell(
            onTap: iconActionsCallbacks[index],
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
              ),
              child: Icon(iconActions[index], color: AppColors.primaryPurple),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTabBarContent(BuildContext context) {
    return Column(
      children: [
        AnimatedRoundedTabbarFilled(
          tabWidth: 190,
          tabs: ['Meal Plans', 'Meal Ideas'],
          tabContents: [
            _buildMealPlans(context),
            Center(
              child: SafeArea(
                child: Center(
                  child: GlassContainer(
                    height: 200,
                    width: 400,
                    blur: 4,
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        AppColors.white.withValues(alpha: 0.8),
                        AppColors.white.withValues(alpha: 0.8),
                      ],
                    ),
                    border: Border.fromBorderSide(
                      BorderSide(
                        color: AppColors.white.withValues(alpha: 0.6),
                        width: 1,
                      ),
                    ),
                    borderRadius: BorderRadius.circular(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 10,
                          children: [
                            Icon(
                              Icons.restaurant_menu,
                              color: AppColors.white,
                              size: 32,
                            ),
                            Text(
                              "Meal Ideas",
                              style: AppTextStyles.titleMedium.copyWith(
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: AppColors.neonYellow,
                            foregroundColor: AppColors.dark,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 32,
                              vertical: 16,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MealIdeasScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "Discover",
                            style: AppTextStyles.bodyMedium.copyWith(
                              color: AppColors.dark,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMealPlans(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildBannerTop,
        _buildRecommendationCard,
        _buildRecipesForYouCard(context),
      ],
    );
  }

  get _buildBannerTop {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Column(
        spacing: 20,
        children: [
          Stack(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(12),
                ),
                clipBehavior: Clip.hardEdge,
                child: CachedNetworkImage(
                  imageUrl:
                      'https://images.pexels.com/photos/841130/pexels-photo-841130.jpeg',
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                  placeholder: (context, url) =>
                      Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  height: 21,
                  width: 131,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                    color: AppColors.neonYellow,
                  ),
                  child: Text(
                    textAlign: TextAlign.center,
                    'training of the day',
                    style: AppTextStyles.descriptionSmall.copyWith(
                      color: AppColors.dark,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withValues(alpha: 0.4),
                            Colors.black.withValues(alpha: 0.0),
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, top: 5),
                        child: Column(
                          spacing: 8,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'functional training',
                              style: AppTextStyles.bodySmall.copyWith(
                                color: AppColors.neonYellow,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.timer,
                                      size: 14,
                                      color: AppColors.white,
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      '30 min',
                                      style: AppTextStyles.bodySmall.copyWith(
                                        color: AppColors.white,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    SizedBox(width: 20),
                                    Icon(
                                      Icons.local_fire_department,
                                      size: 14,
                                      color: AppColors.white,
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      '1450 Kcal',
                                      style: AppTextStyles.bodySmall.copyWith(
                                        color: AppColors.white,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    SizedBox(width: 20),
                                    Icon(
                                      Icons.run_circle,
                                      size: 14,
                                      color: AppColors.white,
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      '5 exercises',
                                      style: AppTextStyles.bodySmall.copyWith(
                                        color: AppColors.white,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 14,
                bottom: 15,
                child: Icon(
                  Icons.star_rounded,
                  size: 32,
                  color: AppColors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  get _buildRecommendationCard {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recommendations',
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.neonYellow,
                ),
              ),
              Row(
                children: [
                  Text(
                    'See All',
                    style: AppTextStyles.descriptionSmall.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                  Icon(Icons.arrow_right, color: AppColors.neonYellow),
                ],
              ),
            ],
          ),
          SizedBox(height: 16),
          // Horizontal scroll cards
          SizedBox(
            height: 230,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Row(
                children: List.generate(HomeData.homeDataCard.length, (index) {
                  final item = HomeData.homeDataCard[index];
                  return Container(
                    margin: const EdgeInsets.only(right: 12),
                    width: 180,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Image stack with icons
                        Stack(
                          children: [
                            Container(
                              height: 140,
                              decoration: BoxDecoration(
                                color: AppColors.secondaryPurple,
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                  image: NetworkImage(item.image),
                                  filterQuality: FilterQuality.high,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 12,
                              right: 12,
                              child: Icon(
                                Icons.star_rate_rounded,
                                color: AppColors.neonYellow,
                              ),
                            ),
                            Positioned(
                              bottom: 12,
                              right: 12,
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: AppColors.primaryPurple,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.play_arrow,
                                  color: AppColors.neonYellow,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        // Title
                        Text(
                          item.title,
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: AppColors.neonYellow,
                          ),
                        ),
                        SizedBox(height: 4),
                        // Timer & Calorie row
                        Padding(
                          padding: const EdgeInsets.only(right: 11),
                          child: Row(
                            children: [
                              Icon(
                                item.timerIcon,
                                size: 16,
                                color: AppColors.primaryPurple,
                              ),
                              SizedBox(width: 4),
                              Text(
                                item.timerText,
                                style: AppTextStyles.descriptionSmall.copyWith(
                                  color: AppColors.neonYellow,
                                ),
                              ),
                              Spacer(),
                              Icon(
                                item.calorieIcon,
                                size: 16,
                                color: AppColors.primaryPurple,
                              ),
                              SizedBox(width: 4),
                              Text(
                                item.calorieText,
                                style: AppTextStyles.descriptionSmall.copyWith(
                                  color: AppColors.neonYellow,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecipesForYouCard(BuildContext context) {
    List<Recipe> recipes = [
      Recipe(
        title: "Avocado Salad",
        duration: "15 mins",
        calories: "120 kcal",
        imageUrl:
            "https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg",
        isFavorite: true,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const NutritionMealPlans()),
          );
        },
      ),
      Recipe(
        title: "Grilled Chicken",
        duration: "30 mins",
        calories: "350 kcal",
        imageUrl:
            "https://images.pexels.com/photos/410648/pexels-photo-410648.jpeg",
        onTap: () {
          // print("Grilled Chicken tapped!");
        },
      ),
      Recipe(
        title: "Avocado Salad",
        duration: "15 mins",
        calories: "120 kcal",
        imageUrl:
            "https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg",
        isFavorite: true,
        onTap: () {
          // print("Avocado Salad tapped!");
        },
      ),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recipes for You',
          style: AppTextStyles.bodyMedium.copyWith(color: AppColors.neonYellow),
        ),
        ...recipes.map(
          (recipe) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: RecipeCard(recipe: recipe),
          ),
        ),
      ],
    );
  }
}

//
class NutritionMealPlans extends StatelessWidget {
  const NutritionMealPlans({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: AppColors.dark.withValues(alpha: 0.7),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_outlined,
              color: AppColors.white,
              size: 28,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: GlassContainer(
              height: 200,
              width: 400,
              blur: 4,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.white.withValues(alpha: 0.8),
                  AppColors.white.withValues(alpha: 0.8),
                ],
              ),
              border: Border.fromBorderSide(
                BorderSide(
                  color: AppColors.white.withValues(alpha: 0.6),
                  width: 1,
                ),
              ),
              borderRadius: BorderRadius.circular(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 10,
                    children: [
                      Icon(
                        Icons.restaurant_menu,
                        color: AppColors.dark,
                        size: 32,
                      ),
                      Text(
                        "Nutrition Meal Plans",
                        style: AppTextStyles.titleMedium.copyWith(
                          color: AppColors.dark,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: AppColors.neonYellow,
                      foregroundColor: AppColors.dark,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const NutritionMealPlansDetail(),
                        ),
                      );
                    },
                    child: Text(
                      "Know your plan",
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.dark,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
