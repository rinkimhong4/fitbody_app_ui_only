import 'package:fitbody_app_ui/config/route/app_route.dart';
import 'package:fitbody_app_ui/config/theme/app_theme.dart';
import 'package:fitbody_app_ui/core/data/home_data.dart';
import 'package:fitbody_app_ui/widgets/custom_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(backgroundColor: AppColors.dark, body: _buildBody),
    );
  }

  get _buildBody {
    return NestedScrollView(
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
            _buildTabBarView,
            //
          ],
        ),
      ),
    );
  }

  SliverAppBar get _buildSliverAppBar {
    return SliverAppBar(
      backgroundColor: AppColors.secondaryPurple,
      floating: false,
      pinned: true,
      leading: GestureDetector(
        onTap: () => Get.toNamed(AppRoute.home),
        child: Icon(Icons.arrow_back_ios_new_outlined, color: AppColors.white),
      ),
      title: Text(
        'Notifications',
        style: AppTextStyles.titleMedium.copyWith(color: AppColors.white),
      ),
      centerTitle: false,
    );
  }

  get _buildTabBarView {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: AnimatedRoundedTabbarFilled(
        tabWidth: 180,
        tabs: ['Reminders', 'System'],
        tabContents: [_buildNotificationReminder, _buildNotificationSystem],
      ),
    );
  }

  get _buildNotificationReminder {
    final data = Datas.notificationData['data'] as Map<String, dynamic>;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: data.entries.map((entry) {
        final category = entry.key;
        final categoryData = entry.value as Map<String, dynamic>;
        final items = categoryData['datas'] as List<dynamic>;

        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Category title
              Text(
                category.capitalizeFirst!,
                style: AppTextStyles.bodySmall.copyWith(color: AppColors.white),
              ),
              SizedBox(height: 12),

              /// Notification list
              Column(
                children: items.map((item) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: _buildNotificationTile(
                      name: item['name'],
                      description: item['description'],
                      time: item['time'],
                      image: item['image'],
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

/// Single notification card
Widget _buildNotificationTile({
  required String name,
  required String description,
  required String time,
  required String image,
}) {
  return Container(
    height: 72,
    width: double.infinity,
    padding: const EdgeInsets.symmetric(horizontal: 16),
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Row(
      children: [
        /// Avatar
        ClipOval(child: Image.asset(image, height: 44, width: 44)),
        SizedBox(width: 12),

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
              const SizedBox(height: 4),
              Text(
                description,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.descriptionSmall.copyWith(
                  color: AppColors.dark,
                ),
              ),
            ],
          ),
        ),

        /// Time
        Text(
          time,
          style: AppTextStyles.descriptionSmall.copyWith(
            color: AppColors.primaryPurple,
          ),
        ),
      ],
    ),
  );
}

get _buildNotificationSystem {
  final data = Datas.systemNotificationData['data'] as Map<String, dynamic>;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: data.entries.map((entry) {
      final category = entry.key;
      final categoryData = entry.value as Map<String, dynamic>;
      final items = categoryData['datas'] as List<dynamic>;

      return Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Category title
            Text(
              category.capitalizeFirst!,
              style: AppTextStyles.bodySmall.copyWith(color: AppColors.white),
            ),
            SizedBox(height: 12),

            /// Notification list
            Column(
              children: items.map((item) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: _buildNotificationTile(
                    name: item['name'],
                    description: item['description'],
                    time: item['time'],
                    image: item['image'],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      );
    }).toList(),
  );
}
