import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitbody_app_ui/config/route/app_route.dart';
import 'package:fitbody_app_ui/config/theme/app_theme.dart';
import 'package:fitbody_app_ui/core/data/home_data.dart';
import 'package:fitbody_app_ui/modules/items/top_menu_home/work_out/workout_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WorkOutListScreen extends StatelessWidget {
  const WorkOutListScreen({super.key});

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
          return [_buildSliverAppBar];
        },
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //
              _buildTabBarBeginner,
              _buildWorkoutData(context),
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
      leading: GestureDetector(
        onTap: () => Navigator.of(Get.context!).pop(),
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
            'Beginner',
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
        ],
      ),
    );
  }

  Widget _buildWorkoutData(BuildContext context) {
    final data = Datas.workoutData['data'] as Map<String, dynamic>;

    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: data.entries.map((entry) {
          final roundData = entry.value as Map<String, dynamic>;
          final roundName = roundData['roundName'] as String;
          final exercises = roundData['exercises'] as List<dynamic>;

          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Round title
                Text(
                  roundName,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.white,
                  ),
                ),
                SizedBox(height: 12),

                /// Exercise list
                Column(
                  children: exercises.map((exercise) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: _buildWorkoutTile(
                        name: exercise['exerciseName'],
                        description: exercise['repetition'],
                        time: exercise['duration'],
                        image: exercise['image'],
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  WorkoutDetailScreen(exercise: exercise),
                            ),
                          );
                        },
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  /// Reusing your same UI (only mapping changed)
  Widget _buildWorkoutTile({
    required String name,
    required String description,
    required String time,
    required String image,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 72,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Container(
              height: 44,
              width: 44,
              decoration: BoxDecoration(
                color: AppColors.primaryPurple,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.play_arrow_rounded, color: AppColors.white),
            ),
            SizedBox(width: 13),

            /// Texts
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: AppTextStyles.descriptionMedium.copyWith(
                      color: AppColors.dark,
                    ),
                  ),

                  SizedBox(height: 4),
                  Row(
                    spacing: 10,
                    children: [
                      Icon(
                        Icons.timer,
                        size: 18,
                        color: AppColors.primaryPurple,
                      ),
                      Text(
                        time,
                        style: AppTextStyles.descriptionSmall.copyWith(
                          color: AppColors.primaryPurple,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            /// repeat
            Text(
              description,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.primaryPurple,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
