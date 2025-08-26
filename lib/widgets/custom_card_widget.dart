import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitbody_app_ui/config/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CustomCardWidget extends StatelessWidget {
  final String title;
  final String duration;
  final String calories;
  final String exerciseCount;
  final String imageUrl;
  final bool isFavorite;

  const CustomCardWidget({
    super.key,
    required this.title,
    required this.duration,
    required this.calories,
    required this.exerciseCount,
    required this.imageUrl,
    this.isFavorite = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Left Content Section
        Expanded(
          flex: 2,
          child: Container(
            height: 120,
            decoration: const BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title, style: AppTextStyles.bodyLarge),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.timer, color: AppColors.neonYellow),
                    const SizedBox(width: 4),
                    Text(duration),
                    const SizedBox(width: 16),
                    const Icon(
                      Icons.local_fire_department,
                      color: AppColors.neonYellow,
                    ),
                    const SizedBox(width: 4),
                    Text(calories),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.run_circle_rounded,
                      color: AppColors.neonYellow,
                    ),
                    const SizedBox(width: 4),
                    Text(exerciseCount),
                  ],
                ),
              ],
            ),
          ),
        ),

        // Right Image Section
        Expanded(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 120,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(imageUrl),
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),
              ),

              // Favorite Star
              if (isFavorite)
                Padding(
                  padding: const EdgeInsets.only(top: 10, right: 10),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Icon(
                      Icons.star_rounded,
                      color: AppColors.neonYellow,
                    ),
                  ),
                ),

              // Play Button
              Positioned(
                top: 45,
                left: -22,
                child: Container(
                  width: 44,
                  height: 44,
                  decoration: const BoxDecoration(
                    color: AppColors.primaryPurple,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.play_arrow_rounded,
                    color: AppColors.neonYellow,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
