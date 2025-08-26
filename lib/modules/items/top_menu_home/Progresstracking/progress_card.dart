import 'package:fitbody_app_ui/config/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ActivityCard extends StatelessWidget {
  final String day;
  final String date;
  final String steps;
  final String duration;

  const ActivityCard({
    super.key,
    required this.day,
    required this.date,
    required this.steps,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.primaryPurple,
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Day & Date
            Column(
              spacing: 5,
              children: [
                Text(
                  day,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.white,
                  ),
                ),
                Text(
                  date,
                  style: AppTextStyles.titleLarge.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
            SizedBox(width: 40),
            // Divider
            Container(width: 2, height: 60, color: AppColors.white),
            SizedBox(width: 40),

            // Steps
            Column(
              spacing: 5,
              children: [
                Text(
                  'Steps',
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.white,
                  ),
                ),
                Text(
                  steps,
                  style: AppTextStyles.titleLarge.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),

            SizedBox(width: 40),

            // Duration
            Column(
              spacing: 5,
              children: [
                Text(
                  'Duration',
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.white,
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.timer, color: AppColors.white, size: 16),
                    SizedBox(width: 4),
                    Text(
                      duration,
                      style: AppTextStyles.titleLarge.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
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

class Activity {
  final String day;
  final String date;
  final String steps;
  final String duration;

  Activity({
    required this.day,
    required this.date,
    required this.steps,
    required this.duration,
  });
}
