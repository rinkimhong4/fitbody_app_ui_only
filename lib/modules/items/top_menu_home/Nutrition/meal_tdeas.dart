import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitbody_app_ui/config/route/app_route.dart';
import 'package:fitbody_app_ui/config/theme/app_theme.dart';
import 'package:fitbody_app_ui/modules/items/top_menu_home/Nutrition/meal_plans.dart';
import 'package:fitbody_app_ui/modules/items/top_menu_home/Nutrition/nutrition_card.dart';
import 'package:fitbody_app_ui/widgets/custom_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MealIdeasScreen extends StatelessWidget {
  const MealIdeasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppColors.dark, body: _buildBody);
  }

  Widget get _buildBody {
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
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [_buildMealPlans],
          ),
        ),
      ),
    );
  }

  get _buildMealPlans {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedRoundedTabbarFilled(
          tabWidth: 130,
          tabs: ['Breakfast', 'Luch', 'Dinner'],
          tabContents: [
            /// all of this content similar, chnage the data to chnage the content tab
            ///  breakfast tab content
            _buildMealPlansBody(Get.context!),

            /// lunch tab content
            _buildMealPlansBody(Get.context!),

            /// dinner tab content
            _buildMealPlansBody(Get.context!),
          ],
        ),
      ],
    );
  }

  Widget _buildMealPlansBody(BuildContext context) {
    return Column(spacing: 20, children: [_buildRecipesForYouCard(context)]);
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
            MaterialPageRoute(builder: (context) => const MealPlansDetails()),
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
        _buildBannerTop,
        SizedBox(height: 20),
        Text(
          'Breakfast plan for you',
          style: AppTextStyles.titleSmall.copyWith(color: AppColors.neonYellow),
        ),
        Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.',
          style: AppTextStyles.descriptionSmall.copyWith(
            color: AppColors.white,
          ),
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
            'Meal plans',
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
}
