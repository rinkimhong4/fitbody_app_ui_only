import 'package:fitbody_app_ui/config/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CustomActionButtons extends StatelessWidget {
  final VoidCallback onTap;

  final String title;
  const CustomActionButtons({
    super.key,
    required this.onTap,

    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: AppColors.neonYellow,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          child: Row(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text(title, style: AppTextStyles.titleMedium)],
          ),
        ),
      ),
    );
  }
}
