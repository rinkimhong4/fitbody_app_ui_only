import 'package:fitbody_app_ui/config/route/app_route.dart';
import 'package:fitbody_app_ui/config/theme/app_theme.dart';
import 'package:fitbody_app_ui/core/data/home_data.dart';
import 'package:fitbody_app_ui/widgets/custom_card_widget.dart';
import 'package:fitbody_app_ui/widgets/custom_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResourcesScreen extends StatelessWidget {
  const ResourcesScreen({super.key});

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
          return [_buildSliverAppBar];
        },
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [_buildTabContent],
          ),
        ),
      ),
    );
  }

  get _buildTabContent {
    return Column(
      children: [
        AnimatedRoundedTabbarFilled(
          tabWidth: 190,
          tabs: ['Workout Videos', 'Articles & Tips'],
          tabContents: [_buildWorkoutVideos, _buildTabBarBeginnerList],
        ),
      ],
    );
  }

  get _buildWorkoutVideos {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick & Easy Workout Videos',
          style: AppTextStyles.titleMedium.copyWith(
            color: AppColors.neonYellow,
          ),
        ),
        Text(
          'Discover Fresh Workouts: Elevate Your Training',
          style: AppTextStyles.descriptionSmall.copyWith(
            color: AppColors.white,
          ),
        ),
        _buildRecommendationCard,
      ],
    );
  }

  get _buildTabBarBeginnerList {
    List<Map<String, dynamic>> allTabData = [
      {
        'title': 'upper body',
        'duration': '45 Minutes',
        'calories': '980 Kcal',
        'exerciseCount': '8 exercises',
        'imageUrl':
            'https://t4.ftcdn.net/jpg/01/74/21/25/240_F_174212531_cerVf4uP6vinBWieBB46p2P5xVhnsNSK.jpg',
        'isFavorite': true,
        'ontap': () {
          Get.toNamed(AppRoute.mealPlansDetails);
        },
      },
      {
        'title': 'lower body',
        'duration': '30 Minutes',
        'calories': '600 Kcal',
        'exerciseCount': '5 exercises',
        'imageUrl':
            'https://images.unsplash.com/photo-1579758629938-03607ccdbaba',
        'isFavorite': false,
        'ontap': () {},
      },
      {
        'title': 'full body',
        'duration': '60 Minutes',
        'calories': '1200 Kcal',
        'exerciseCount': '10 exercises',
        'imageUrl':
            'https://images.unsplash.com/photo-1605296867304-46d5465a13f1',
        'isFavorite': true,
        'ontap': () {},
      },
      {
        'title': 'upper body',
        'duration': '45 Minutes',
        'calories': '980 Kcal',
        'exerciseCount': '8 exercises',
        'imageUrl':
            'https://t4.ftcdn.net/jpg/01/74/21/25/240_F_174212531_cerVf4uP6vinBWieBB46p2P5xVhnsNSK.jpg',
        'isFavorite': true,
        'ontap': () {},
      },
      {
        'title': 'lower body',
        'duration': '30 Minutes',
        'calories': '600 Kcal',
        'exerciseCount': '5 exercises',
        'imageUrl':
            'https://images.unsplash.com/photo-1579758629938-03607ccdbaba',
        'isFavorite': false,
        'ontap': () {},
      },
      {
        'title': 'full body',
        'duration': '60 Minutes',
        'calories': '1200 Kcal',
        'exerciseCount': '10 exercises',
        'imageUrl':
            'https://images.unsplash.com/photo-1605296867304-46d5465a13f1',
        'isFavorite': true,
        'ontap': () {},
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var item in allTabData) ...[
          GestureDetector(
            onTap: item['ontap'],
            child: CustomCardWidget(
              title: item['title'],
              duration: item['duration'],
              calories: item['calories'],
              exerciseCount: item['exerciseCount'],
              imageUrl: item['imageUrl'],
              isFavorite: item['isFavorite'],
            ),
          ),
          SizedBox(height: 20),
        ],
      ],
    );
  }

  get _buildRecommendationCard {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: HomeData.homeDataCard.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            final item = HomeData.homeDataCard[index];
            return GestureDetector(
              onTap: () => Get.toNamed(AppRoute.mealPlansDetails),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image stack with icons
                    Stack(
                      children: [
                        Container(
                          height: 120,
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
                          top: 8,
                          right: 8,
                          child: Icon(
                            Icons.star_rate_rounded,
                            color: AppColors.neonYellow,
                          ),
                        ),
                        Positioned(
                          bottom: 8,
                          right: 8,
                          child: Container(
                            width: 28,
                            height: 28,
                            decoration: BoxDecoration(
                              color: AppColors.primaryPurple,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.play_arrow,
                              color: AppColors.neonYellow,
                              size: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    // Title
                    Text(
                      item.title,
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.neonYellow,
                      ),
                    ),
                    const SizedBox(height: 4),
                    // Timer & Calorie row
                    Row(
                      children: [
                        Icon(
                          item.timerIcon,
                          size: 14,
                          color: AppColors.neonYellow,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          item.timerText,
                          style: AppTextStyles.descriptionSmall.copyWith(
                            color: AppColors.neonYellow,
                          ),
                        ),
                        const Spacer(),
                        Icon(
                          item.calorieIcon,
                          size: 14,
                          color: AppColors.neonYellow,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          item.calorieText,
                          style: AppTextStyles.descriptionSmall.copyWith(
                            color: AppColors.neonYellow,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  get _buildSliverAppBar {
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
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'resources',
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
