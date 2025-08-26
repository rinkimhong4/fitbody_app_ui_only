import 'package:fitbody_app_ui/config/theme/app_theme.dart';
import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final Color color;
  const SocialButton({
    super.key,
    required this.onTap,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: color,
        ),
        child: Row(
          children: [
            SizedBox(width: 10),
            SizedBox(width: 10),
            Container(width: 2, height: 40, color: Colors.white),
            SizedBox(width: 10),
            Text(
              title,
              style: AppTextStyles.bodyMedium.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
