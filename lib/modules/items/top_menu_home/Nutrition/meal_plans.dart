import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitbody_app_ui/config/route/app_route.dart';
import 'package:fitbody_app_ui/config/theme/app_theme.dart';
import 'package:fitbody_app_ui/modules/items/top_menu_home/Nutrition/nutrition_card.dart';
import 'package:fitbody_app_ui/modules/items/top_menu_home/Nutrition/nutrition_screen.dart';
import 'package:fitbody_app_ui/widgets/button_blur_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MealPlans extends StatelessWidget {
  const MealPlans({super.key});

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
            children: [_buildMealPlansBody(context)],
          ),
        ),
      ),
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

/// Meal Plans Screen Details
class MealPlansDetails extends StatelessWidget {
  const MealPlansDetails({super.key});

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
            children: [_buildMealPlansBody(context)],
          ),
        ),
      ),
    );
  }

  Widget _buildMealPlansBody(BuildContext context) {
    return Column(spacing: 20, children: [_buildDetailsContent]);
  }

  get _buildDetailsContent {
    return Column(
      spacing: 10,
      children: [
        Row(
          spacing: 10,
          children: [
            Text(
              'Avocado and egg toast',
              style: AppTextStyles.titleMedium.copyWith(
                color: AppColors.neonYellow,
              ),
            ),
            Icon(Icons.star_rounded, size: 24, color: AppColors.neonYellow),
          ],
        ),
        Row(
          spacing: 20,
          children: [
            Row(
              spacing: 10,
              children: [
                Icon(Icons.timer, size: 18, color: AppColors.primaryPurple),
                Text(
                  '15 Minutes',
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
            Row(
              spacing: 10,
              children: [
                Icon(Icons.timer, size: 18, color: AppColors.primaryPurple),
                Text(
                  '15 Minutes',
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
        _buildDetailsCard,
      ],
    );
  }

  get _buildDetailsCard {
    return Column(
      spacing: 20,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DetailsCardWidget(
          imageUrl:
              'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg',
          sections: [
            DetailSection(
              title: 'Ingredients',
              items: [
                'Wholemeal bread',
                'Ripe avocado slices',
                'Fried or poached egg',
              ],
            ),
            DetailSection(
              title: 'Steps',
              items: [
                'Toast the bread',
                'Slice the avocado',
                'Cook the egg',
                'Assemble everything',
              ],
            ),
            DetailSection(
              title: 'Nutrition Facts',
              items: ['Calories: 350', 'Protein: 12g', 'Fat: 20g'],
            ),
          ],
        ),
        Center(
          child: BlurredButton(
            width: 200,
            label: 'Save Recipe',
            onPressed: () {
              Get.to(() => const NutritionScreen());
            },
          ),
        ),
      ],
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
}

/// Represents a section of details in the meal plan.
class DetailSection {
  final String title;
  final List<String> items;

  DetailSection({required this.title, required this.items});
}

class DetailsCardWidget extends StatelessWidget {
  final String imageUrl;
  final List<DetailSection> sections;

  const DetailsCardWidget({
    super.key,
    required this.imageUrl,
    required this.sections,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 200,
          decoration: BoxDecoration(
            color: AppColors.neonYellow,
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: CachedNetworkImageProvider(imageUrl),
              filterQuality: FilterQuality.high,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 20),
        // Render all sections
        ...sections.map(
          (section) => Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  section.title,
                  style: AppTextStyles.bodyLarge.copyWith(
                    color: AppColors.neonYellow,
                  ),
                ),
                const SizedBox(height: 10),
                ...section.items.map(
                  (item) => Text(
                    "• $item",
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
