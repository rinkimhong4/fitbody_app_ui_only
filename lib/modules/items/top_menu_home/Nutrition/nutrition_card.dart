import 'package:fitbody_app_ui/config/theme/app_theme.dart';
import 'package:flutter/material.dart';

// data model for recipe
class Recipe {
  final String title;
  final String duration;
  final String calories;
  final String imageUrl;
  final bool isFavorite;
  final VoidCallback onTap;

  Recipe({
    required this.onTap,
    required this.title,
    required this.duration,
    required this.calories,
    required this.imageUrl,
    this.isFavorite = false,
  });
}
//

class RecipeCard extends StatelessWidget {
  final Recipe recipe;

  const RecipeCard({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      color: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: GestureDetector(
        onTap: recipe.onTap,
        child: Row(
          children: [
            // Left Content
            Expanded(
              flex: 4,
              child: Container(
                height: 110,
                padding: const EdgeInsets.all(12),
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
                    Text(
                      recipe.title,
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.dark,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.timer,
                              size: 16,
                              color: AppColors.primaryPurple,
                            ),
                            SizedBox(width: 4),
                            Text(
                              recipe.duration,
                              style: AppTextStyles.descriptionSmall.copyWith(
                                color: AppColors.dark,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.local_fire_department,
                              size: 16,
                              color: AppColors.primaryPurple,
                            ),
                            SizedBox(width: 4),
                            Text(
                              recipe.calories,
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
            ),

            // Right Image
            Expanded(
              flex: 2,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    child: Image.network(
                      recipe.imageUrl,
                      height: 110,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  if (recipe.isFavorite)
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Icon(Icons.star_rounded, color: Colors.white),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
