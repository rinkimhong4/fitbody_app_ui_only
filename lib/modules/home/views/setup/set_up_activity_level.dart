import 'package:fitbody_app_ui/config/route/app_route.dart';
import 'package:fitbody_app_ui/config/theme/app_theme.dart';
import 'package:fitbody_app_ui/widgets/button_blur_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SetUpActivityLevel extends StatefulWidget {
  const SetUpActivityLevel({super.key});

  @override
  State<SetUpActivityLevel> createState() => _SetUpActivityLevelState();
}

class _SetUpActivityLevelState extends State<SetUpActivityLevel> {
  int? selectedLevelIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppColors.dark, body: _buildBody);
  }

  get _buildBody {
    return Container(
      color: AppColors.dark,
      child: Column(
        children: [
          _buildAppBar,
          _buildTitle,
          _buildContain,
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 30),
            child: BlurredButton(
              label: 'Continue',
              onPressed: () {
                Get.offAndToNamed(AppRoute.setUpProfile);
              },
            ),
          ),
        ],
      ),
    );
  }

  get _buildAppBar {
    return AppBar(
      backgroundColor: AppColors.dark,
      leading: GestureDetector(
        onTap: () => Get.offAndToNamed(AppRoute.setUpGoal),
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
          "Physical Activity Level",
          style: AppTextStyles.titleLarge.copyWith(color: AppColors.neonYellow),
        ),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(left: 25, right: 25),
          height: 79,
          width: double.infinity,
          color: AppColors.secondaryPurple,
          child: Text(
            'Please specify your physical activity level by selecting one of the options below.',
            style: AppTextStyles.bodyMedium.copyWith(color: AppColors.white),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 30),
      ],
    );
  }

  get _buildContain {
    List<String> data = ['Beginner', 'Intermediate', 'Advance'];

    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 30),
      child: Column(
        children: List.generate(
          data.length,
          (index) => Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedLevelIndex = index;
                });
              },
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 64,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: selectedLevelIndex == index
                      ? AppColors.neonYellow
                      : AppColors.secondaryPurple,
                ),
                child: Text(
                  data[index],
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: selectedLevelIndex == index
                        ? AppColors.dark
                        : AppColors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
