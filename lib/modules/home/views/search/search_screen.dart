import 'package:fitbody_app_ui/config/route/app_route.dart';
import 'package:fitbody_app_ui/config/theme/app_theme.dart';
import 'package:fitbody_app_ui/core/data/home_data.dart';
import 'package:fitbody_app_ui/widgets/custom_card_widget.dart';
import 'package:fitbody_app_ui/widgets/custom_tab_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.dark,
        body: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          leading: GestureDetector(
            onTap: () => Get.offAndToNamed(AppRoute.home),
            child: Icon(
              Icons.arrow_left_sharp,
              color: AppColors.neonYellow,
              size: 38,
            ),
          ),
          title: Text(
            'Search',
            style: AppTextStyles.titleMedium.copyWith(
              color: AppColors.primaryPurple,
            ),
          ),
          centerTitle: false,
          collapsedHeight: 110,
          expandedHeight: 150,
          floating: false,
          pinned: true,
          snap: false,
          backgroundColor: AppColors.dark,
          elevation: 0,
          flexibleSpace: LayoutBuilder(
            builder: (context, constraints) {
              final isCollapsed = constraints.maxHeight <= kToolbarHeight + 20;
              return FlexibleSpaceBar(
                centerTitle: true,
                titlePadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                title: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  child: isCollapsed
                      ? _buildSearchBar(compact: true)
                      : _buildSearchBar(compact: false),
                ),
              );
            },
          ),
        ),

        /// 🔹 TabBar with Tab Contents
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: AnimatedRoundedTabbarFilled(
              tabs: ['All', 'Workouts', 'Nutrition'],
              tabContents: [
                _buildTabAllContent,
                _buildTabWorkoutsContent,
                _buildTabNutritionContent,
              ],
            ),
          ),
        ),
      ],
    );
  }

  /// Custom SearchBar
  Widget _buildSearchBar({bool compact = false}) {
    return Container(
      height: compact ? 36 : 44,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: AppColors.primaryPurple.withValues(alpha: 0.5),
        ),
      ),
      child: Row(
        children: [
          Icon(
            CupertinoIcons.search,
            color: AppColors.white.withValues(alpha: 0.8),
            size: compact ? 18 : 22,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              style: TextStyle(
                color: AppColors.white,
                fontSize: compact ? 14 : 16,
              ),
              decoration: InputDecoration(
                hintText: 'Search workouts, meals...',
                hintStyle: TextStyle(
                  color: AppColors.primaryPurple,
                  fontSize: compact ? 12 : 14,
                ),
                border: InputBorder.none,
                isCollapsed: true,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Tab _buildTabAllContent content
  get _buildTabAllContent {
    return Column(
      children: [
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
        _buildTabBarArticle,
      ],
    );
  }

  get _buildTabBarArticle {
    List<Map<String, dynamic>> allTabData = [
      {
        'title': 'upper body',
        'duration': '45 Minutes',
        'calories': '980 Kcal',
        'exerciseCount': '8 exercises',
        'imageUrl':
            'https://t4.ftcdn.net/jpg/01/74/21/25/240_F_174212531_cerVf4uP6vinBWieBB46p2P5xVhnsNSK.jpg',
        'isFavorite': true,
      },
      {
        'title': 'lower body',
        'duration': '30 Minutes',
        'calories': '600 Kcal',
        'exerciseCount': '5 exercises',
        'imageUrl':
            'https://images.unsplash.com/photo-1579758629938-03607ccdbaba',
        'isFavorite': false,
      },
      {
        'title': 'full body',
        'duration': '60 Minutes',
        'calories': '1200 Kcal',
        'exerciseCount': '10 exercises',
        'imageUrl':
            'https://images.unsplash.com/photo-1605296867304-46d5465a13f1',
        'isFavorite': true,
      },
      {
        'title': 'cardio blast',
        'duration': '20 Minutes',
        'calories': '500 Kcal',
        'exerciseCount': '4 exercises',
        'imageUrl': 'https://images.unsplash.com/photo-1558611848-73f7eb4001a1',
        'isFavorite': false,
      },
      {
        'title': 'yoga session',
        'duration': '50 Minutes',
        'calories': '300 Kcal',
        'exerciseCount': '7 exercises',
        'imageUrl':
            'https://t3.ftcdn.net/jpg/01/48/87/16/240_F_148871674_wRvPIuNEwxUI1jHadVrb5uoV7C2Sv27i.jpg',
        'isFavorite': true,
      },
      {
        'title': 'pilates',
        'duration': '40 Minutes',
        'calories': '450 Kcal',
        'exerciseCount': '6 exercises',
        'imageUrl':
            'https://t3.ftcdn.net/jpg/01/68/31/12/240_F_168311257_XvQgbZheKyrdEXm7YalNPtFVtAZbcSdz.jpg',
        'isFavorite': false,
      },
      {
        'title': 'HIIT',
        'duration': '15 Minutes',
        'calories': '350 Kcal',
        'exerciseCount': '3 exercises',
        'imageUrl':
            'https://t3.ftcdn.net/jpg/03/20/45/94/240_F_320459487_SAvrvfR4NN4CkFQccj49rBfmiLoYebuw.jpg',
        'isFavorite': true,
      },
      {
        'title': 'strength training',
        'duration': '70 Minutes',
        'calories': '1100 Kcal',
        'exerciseCount': '12 exercises',
        'imageUrl':
            'https://images.unsplash.com/photo-1579758629938-03607ccdbaba',
        'isFavorite': false,
      },
      {
        'title': 'core workout',
        'duration': '25 Minutes',
        'calories': '400 Kcal',
        'exerciseCount': '5 exercises',
        'imageUrl':
            'https://t3.ftcdn.net/jpg/02/14/59/60/240_F_214596042_QB9lDRVMmAr1mn9eFZFgjL9JONicmjn3.jpg',
        'isFavorite': true,
      },
      {
        'title': 'stretching routine',
        'duration': '10 Minutes',
        'calories': '100 Kcal',
        'exerciseCount': '2 exercises',
        'imageUrl':
            'https://t4.ftcdn.net/jpg/01/19/02/41/240_F_119024139_myvWSH6zo9kwTk91Sn674RA7CfkxI3Ru.jpg',
        'isFavorite': false,
      },
      {
        'title': 'dance cardio',
        'duration': '35 Minutes',
        'calories': '750 Kcal',
        'exerciseCount': '6 exercises',
        'imageUrl':
            'https://t4.ftcdn.net/jpg/04/81/05/21/240_F_481052121_0yjD6RwCvTwe8HJcNNdSaurC1LUix3Un.jpg',
        'isFavorite': true,
      },
    ];
    return Column(
      children: [
        for (var item in allTabData) ...[
          CustomCardWidget(
            title: item['title'],
            duration: item['duration'],
            calories: item['calories'],
            exerciseCount: item['exerciseCount'],
            imageUrl: item['imageUrl'],
            isFavorite: item['isFavorite'],
          ),
          SizedBox(height: 20),
        ],
      ],
    );
  }

  /// Tab _buildTabWorkoutsContent content
  get _buildTabWorkoutsContent {
    List allTabData = ['Circuit', 'Split', 'Challenge', 'Legs', 'Cardio'];
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Top Searches',
          style: AppTextStyles.bodyMedium.copyWith(color: AppColors.white),
        ),
        for (var item in allTabData) ...[
          _buildTabContent(title: item),
          SizedBox(height: 1),
        ],
      ],
    );
  }

  /// Tab _buildTabNutritionContent content
  Widget _buildTabContent({required String title}) {
    return Container(
      height: 52,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: AppColors.white,
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 4, right: 10),
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.neonYellow,
              ),
              child: Icon(Icons.search, color: AppColors.dark),
            ),
          ),
          Text(
            title,
            style: AppTextStyles.bodyMedium.copyWith(color: AppColors.dark),
          ),
        ],
      ),
    );
  }

  /// Tab _buildTabNutritionContent content
  get _buildTabNutritionContent {
    List allTabData = [
      'Breakfast',
      'yogurt',
      'Vegetarian',
      'smoothie',
      'chicken',
    ];
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Top Searches',
          style: AppTextStyles.bodyMedium.copyWith(color: AppColors.white),
        ),
        for (var item in allTabData) ...[
          _buildTabContent(title: item),
          SizedBox(height: 1),
        ],
      ],
    );
  }
}
