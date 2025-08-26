// ignore_for_file: file_names

import 'package:fitbody_app_ui/config/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ActivityCardWidget extends StatelessWidget {
  final ActivityItem activity;

  const ActivityCardWidget({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Circular Icon
            Container(
              width: 44,
              height: 44,
              decoration: const BoxDecoration(
                color: AppColors.primaryPurple,
                shape: BoxShape.circle,
              ),
              child: Icon(activity.icon, size: 24, color: AppColors.white),
            ),

            // Left Column
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.local_fire_department,
                      size: 14,
                      color: AppColors.primaryPurple,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      activity.calories,
                      style: AppTextStyles.descriptionSmall.copyWith(
                        color: AppColors.dark,
                      ),
                    ),
                  ],
                ),
                Text(
                  activity.name,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.dark,
                  ),
                ),
                Text(
                  activity.date,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.dark,
                  ),
                ),
              ],
            ),

            // Right Column
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Duration",
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.dark,
                  ),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.timer,
                      size: 24,
                      color: AppColors.primaryPurple,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      activity.duration,
                      style: AppTextStyles.descriptionSmall.copyWith(
                        color: AppColors.dark,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Model
class ActivityItem {
  final String name;
  final String date;
  final String calories;
  final String duration;
  final IconData icon;

  ActivityItem({
    required this.name,
    required this.date,
    required this.calories,
    required this.duration,
    required this.icon,
  });
}
