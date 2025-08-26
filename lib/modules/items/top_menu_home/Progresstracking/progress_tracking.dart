import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitbody_app_ui/config/route/app_route.dart';
import 'package:fitbody_app_ui/config/theme/app_theme.dart';
import 'package:fitbody_app_ui/modules/items/top_menu_home/Progresstracking/activities_card%20copy.dart';
import 'package:fitbody_app_ui/modules/items/top_menu_home/Progresstracking/progress_card.dart';
import 'package:fitbody_app_ui/widgets/custom_tab_bar.dart';
import 'package:fitbody_app_ui/modules/items/top_menu_home/Progresstracking/progress_chart.dart';
import 'package:fitbody_app_ui/widgets/date_time_line_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProgressTracking extends StatelessWidget {
  const ProgressTracking({super.key});

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
          // padding: const EdgeInsets.symmetric(horizontal: 24),
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //
              _buildCardProfile,
              SizedBox(height: 20),
              DateTimeLineWidget(),
              SizedBox(height: 20),
              _buildTabBar,
            ],
          ),
        ),
      ),
    );
  }

  //
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
            'Progress tracking',
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

  //
  get _buildCardProfile {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
        height: 125,
        decoration: BoxDecoration(
          color: AppColors.primaryPurple,
          borderRadius: BorderRadius.circular(12),
        ),
        // User avatar and name
        child: Row(
          spacing: 30,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // User information
                  Row(
                    children: [
                      Text(
                        " Madison",
                        style: AppTextStyles.titleMedium.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      Icon(Icons.male, color: Colors.white),
                    ],
                  ),
                  Text(
                    "Age: 20",
                    style: AppTextStyles.bodySmall.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 14),
                  Row(
                    spacing: 40,
                    children: [
                      StatCard(value: '75 Kg', label: 'Weight'),
                      StatCard(value: '75 Kg', label: 'Weight'),
                    ],
                  ),
                ],
              ),
            ),
            CircleAvatar(
              radius: 50,
              backgroundImage: CachedNetworkImageProvider(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMD0lz4NUrtTZYBibQopOViJJqUlejYVhaqQ&s',
              ),
            ),
          ],
        ),
      ),
    );
  }

  // build tabbar
  get _buildTabBar {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: AnimatedRoundedTabbarFilled(
        tabWidth: 190,
        tabs: ['Workout Log', ' Charts'],
        tabContents: [_buildWorkoutLog, _buildChart],
      ),
    );
  }

  get _buildWorkoutLog {
    List<ActivityItem> activities = [
      ActivityItem(
        name: "Upper Body Workout",
        date: "June 09",
        calories: "150 kcal",
        duration: "25 Mins",
        icon: Icons.run_circle,
      ),
      ActivityItem(
        name: "Cardio Session",
        date: "June 10",
        calories: "200 kcal",
        duration: "30 Mins",
        icon: Icons.directions_run,
      ),
      ActivityItem(
        name: "Leg Workout",
        date: "June 11",
        calories: "180 kcal",
        duration: "20 Mins",
        icon: Icons.fitness_center,
      ),
      ActivityItem(
        name: "Leg Workout",
        date: "June 11",
        calories: "180 kcal",
        duration: "20 Mins",
        icon: Icons.fitness_center,
      ),
      ActivityItem(
        name: "Leg Workout",
        date: "June 11",
        calories: "180 kcal",
        duration: "20 Mins",
        icon: Icons.fitness_center,
      ),
      ActivityItem(
        name: "Leg Workout",
        date: "June 11",
        calories: "180 kcal",
        duration: "20 Mins",
        icon: Icons.fitness_center,
      ),
      ActivityItem(
        name: "Leg Workout",
        date: "June 11",
        calories: "180 kcal",
        duration: "20 Mins",
        icon: Icons.fitness_center,
      ),
      ActivityItem(
        name: "Leg Workout",
        date: "June 11",
        calories: "180 kcal",
        duration: "20 Mins",
        icon: Icons.fitness_center,
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Activities',
          style: AppTextStyles.titleMedium.copyWith(
            color: AppColors.neonYellow,
          ),
        ),
        const SizedBox(height: 10),
        ...activities.map(
          (activity) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: ActivityCardWidget(activity: activity),
          ),
        ),
      ],
    );
  }

  get _buildChart {
    List<Activity> activities = [
      Activity(day: 'Mon', date: '10', steps: '4,120', duration: '1hr20m'),
      Activity(day: 'Tue', date: '11', steps: '3,900', duration: '1hr10m'),
      Activity(day: 'Wed', date: '12', steps: '5,000', duration: '1hr50m'),
      Activity(day: 'Thu', date: '14', steps: '3,679', duration: '1hr40m'),
      Activity(day: 'Fri', date: '15', steps: '4,500', duration: '2hr00m'),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 300, child: CartesianChart()),
        SizedBox(height: 20),
        Column(
          children: activities.map((activity) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ActivityCard(
                day: activity.day,
                date: activity.date,
                steps: activity.steps,
                duration: activity.duration,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class StatCard extends StatelessWidget {
  final String value;
  final String label;

  const StatCard({super.key, required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        Container(
          width: 8,
          height: 30,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value,
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              label,
              style: AppTextStyles.descriptionSmall.copyWith(
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
