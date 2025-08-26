import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitbody_app_ui/config/route/app_route.dart';
import 'package:fitbody_app_ui/config/theme/app_theme.dart';
import 'package:fitbody_app_ui/widgets/custom_card_widget.dart';
import 'package:fitbody_app_ui/widgets/custom_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WorkOutScreen extends StatelessWidget {
  const WorkOutScreen({super.key});

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [_buildTabBarContent],
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
            'Workout',
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

  get _buildTabBarContent {
    return Column(
      children: [
        AnimatedRoundedTabbarFilled(
          tabWidth: 127,
          tabs: ['Beginner', 'Intermediate', 'Advanced'],
          tabContents: [
            /// Beginner workouts tab
            _buildTabBarBeginner,

            /// for sample // this is same as _buildTabBarBeginner, this tab for Intermediate workouts
            _buildTabBarBeginner,

            /// for sample // this is same as _buildTabBarBeginner, this tab for Advanced workouts
            _buildTabBarBeginner,
          ],
        ),
      ],
    );
  }

  /// Beginner workouts tab,
  /// This tab is for beginner workouts
  /// and its for Intermediate workouts and Advanced workouts, Change the data for each tab accordingly
  get _buildTabBarBeginner {
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
          _buildTabBarBeginnerList,
        ],
      ),
    );
  }

  /// Beginner workouts list, Change the data for each tab accordingly
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
          Get.toNamed(AppRoute.workOutListScreen);
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
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Let's Go Beginner",
          style: AppTextStyles.titleSmall.copyWith(
            color: AppColors.neonYellow,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          "Explore Different Workout Styles",
          style: AppTextStyles.bodySmall.copyWith(
            color: AppColors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 20),
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
}
