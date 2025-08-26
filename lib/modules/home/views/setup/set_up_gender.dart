import 'dart:ui';

import 'package:fitbody_app_ui/config/route/app_route.dart';
import 'package:fitbody_app_ui/config/theme/app_theme.dart';
import 'package:fitbody_app_ui/widgets/button_blur_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SetUpGender extends StatefulWidget {
  const SetUpGender({super.key});

  @override
  State<SetUpGender> createState() => _SetUpGenderState();
}

class _SetUpGenderState extends State<SetUpGender> {
  bool isMale = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppColors.dark, body: _buildBody);
  }

  get _buildBody {
    return Container(
      color: AppColors.dark,
      child: Column(children: [_buildAppBar, _buildTitle]),
    );
  }

  get _buildAppBar {
    return AppBar(
      backgroundColor: AppColors.dark,
      leading: GestureDetector(
        onTap: () => Get.offAndToNamed(AppRoute.setUpScreen),
        child: Icon(
          Icons.arrow_left_outlined,
          size: 32,
          color: AppColors.neonYellow,
        ),
      ),
      title: Text(
        'Back',
        style: AppTextStyles.bodySmall.copyWith(color: AppColors.neonYellow),
      ),
      centerTitle: false,
    );
  }

  get _buildTitle {
    return Column(
      spacing: 14,
      children: [
        Text(
          "What's Your Gender",
          style: AppTextStyles.titleLarge.copyWith(color: AppColors.neonYellow),
        ),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(left: 25, right: 25),
          height: 79,
          width: double.infinity,
          color: AppColors.secondaryPurple,
          child: Text(
            'Please specify your gender by selecting one of the options below.',
            style: AppTextStyles.bodyMedium.copyWith(color: AppColors.white),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 30),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            _buildGenderButton(
              selected: isMale,
              icon: Icons.male,
              label: 'Male',
              onTap: () {
                setState(() {
                  isMale = true;
                });
              },
            ),
            _buildGenderButton(
              selected: !isMale,
              icon: Icons.female,
              label: 'Female',
              onTap: () {
                setState(() {
                  isMale = false;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, top: 30),
              child: BlurredButton(
                label: 'Continue',
                onPressed: () {
                  Get.offAndToNamed(AppRoute.setUpOld);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildGenderButton({
    required bool selected,
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          width: 160,
          height: 160,
          decoration: BoxDecoration(
            color: selected
                ? AppColors.neonYellow
                : Colors.white.withValues(alpha: 0.2),
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
          ),
          child: TextButton(
            onPressed: onTap,
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            child: Column(
              spacing: 8,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 48,
                  color: selected ? AppColors.dark : AppColors.neonYellow,
                ),
                Text(
                  label,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: selected ? AppColors.dark : AppColors.neonYellow,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
