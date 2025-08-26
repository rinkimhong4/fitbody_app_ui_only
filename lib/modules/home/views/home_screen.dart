import 'package:fitbody_app_ui/config/route/app_route.dart';
import 'package:fitbody_app_ui/config/theme/app_theme.dart';
import 'package:fitbody_app_ui/core/data/home_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
            children: [
              _buildTopMenu,
              _buildRecommendationCard,
              _buildBanner,
              _buildArticleAndTips,
            ],
          ),
        ),
      ),
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
            'Hi, Madison',
            style: AppTextStyles.titleMedium.copyWith(
              color: AppColors.primaryPurple,
            ),
          ),
          Text(
            "It's time to challenge your limits.",
            style: AppTextStyles.descriptionSmall.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.bold,
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

  Widget get _buildTopMenu {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: HomeData.homeDataTopMenu.map((item) {
          return InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () =>
                Get.toNamed(item.route), // 👈 Each item goes to its own screen
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(item.icon, size: 32, color: AppColors.primaryPurple),
                const SizedBox(height: 10),
                Text(
                  item.label,
                  style: AppTextStyles.descriptionMedium.copyWith(
                    color: AppColors.primaryPurple,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
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
                  GestureDetector(
                    onTap: () => Get.toNamed(AppRoute.recommntScreen),
                    child: Text(
                      'See All',
                      style: AppTextStyles.descriptionSmall.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
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
                                color: AppColors.neonYellow,
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
                                color: AppColors.neonYellow,
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

  get _buildBanner {
    return GestureDetector(
      onTap: () => Get.toNamed(AppRoute.workOutListScreen),
      child: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.secondaryPurple,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 110, top: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '  Weekly\n  Challenge',
                      style: AppTextStyles.titleLarge.copyWith(
                        color: AppColors.neonYellow,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Plank With Hip Twist',
                      style: AppTextStyles.descriptionMedium.copyWith(
                        color: AppColors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 14,
              left: 14,
              bottom: 14,
              child: Container(
                width: 75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.dark,
                ),
                child: Column(
                  spacing: 10,
                  children: [
                    Spacer(),
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: AppColors.primaryPurple,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Icon(
                        Icons.fitness_center_outlined,
                        color: AppColors.neonYellow,
                      ),
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      '30 Days',
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
            Positioned(
              top: -50,
              right: 2,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/images/banner-bg.png'),
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  get _buildArticleAndTips {
    const List<ArticleTipData> articleTips = [
      ArticleTipData(
        title: 'Healthy Breakfast Ideas',
        imageUrl:
            'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=600',
        isFavorite: true,
      ),
      ArticleTipData(
        title: '10-Minute Morning Yoga',
        isFavorite: true,
        imageUrl:
            'https://images.pexels.com/photos/4056723/pexels-photo-4056723.jpeg?auto=compress&cs=tinysrgb&w=600',
      ),
      ArticleTipData(
        title: 'Hydration Tips',
        isFavorite: true,
        imageUrl:
            'https://images.pexels.com/photos/1346347/pexels-photo-1346347.jpeg?auto=compress&cs=tinysrgb&w=600',
      ),
      ArticleTipData(
        title: 'Workout Recovery Guide',
        imageUrl:
            'https://images.pexels.com/photos/4045756/pexels-photo-4045756.jpeg?auto=compress&cs=tinysrgb&w=600',
        isFavorite: true,
      ),
      ArticleTipData(
        title: 'High-Protein Meals',
        isFavorite: true,
        imageUrl:
            'https://images.pexels.com/photos/1640774/pexels-photo-1640774.jpeg?auto=compress&cs=tinysrgb&w=600',
      ),
      ArticleTipData(
        title: 'Mental Health & Fitness',
        isFavorite: true,
        imageUrl:
            'https://images.pexels.com/photos/3759651/pexels-photo-3759651.jpeg?auto=compress&cs=tinysrgb&w=600',
      ),
    ];

    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Article & Tips',
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.neonYellow,
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: articleTips.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              mainAxisExtent: 170,
            ),
            itemBuilder: (context, index) {
              final item = articleTips[index];
              return ArticleTipCard(
                title: item.title,
                imageUrl: item.imageUrl,
                isFavorite: item.isFavorite,
              );
            },
          ),
        ],
      ),
    );
  }
}

// ======
class ArticleTipCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final bool isFavorite;

  const ArticleTipCard({
    super.key,
    required this.title,
    required this.imageUrl,
    this.isFavorite = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.neonYellow,
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            if (isFavorite)
              Positioned(
                top: 8,
                right: 10,
                child: Icon(
                  Icons.star_rounded,
                  color: AppColors.neonYellow,
                  size: 24,
                ),
              ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: AppTextStyles.bodySmall.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class ArticleTipData {
  final String title;
  final String imageUrl;
  final bool isFavorite;

  const ArticleTipData({
    required this.title,
    required this.imageUrl,
    this.isFavorite = false,
  });
}
