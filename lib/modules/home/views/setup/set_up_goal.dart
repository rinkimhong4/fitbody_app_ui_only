import 'package:fitbody_app_ui/config/route/app_route.dart';
import 'package:fitbody_app_ui/config/theme/app_theme.dart';
import 'package:fitbody_app_ui/widgets/button_blur_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SetUpGoal extends StatefulWidget {
  const SetUpGoal({super.key});

  @override
  State<SetUpGoal> createState() => _SetUpGoalState();
}

class _SetUpGoalState extends State<SetUpGoal> {
  int? selectedGoalIndex;

  final List<String> data = [
    "Lose Weight",
    "Gain Weight",
    "Muscle Mass Gain",
    "Shape Body",
    "Others",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildAppBar(context),
          const SizedBox(height: 20),
          _buildTitle(),
          const SizedBox(height: 30),
          _buildCheckedCard(),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 30),
            child: BlurredButton(
              label: 'Continue',
              onPressed: () {
                Get.offAndToNamed(AppRoute.setUpActivityLevel);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.dark,
      leading: IconButton(
        onPressed: () => Get.offAndToNamed(AppRoute.setUpHeight),
        icon: Icon(
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
      elevation: 0,
    );
  }

  Widget _buildTitle() {
    return Column(
      spacing: 14,
      children: [
        Text(
          "What Is Your Goal?",
          style: AppTextStyles.titleLarge.copyWith(color: AppColors.neonYellow),
        ),
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 25),
          height: 79,
          width: double.infinity,
          color: AppColors.secondaryPurple,
          child: Text(
            'Please select your fitness goal.',
            style: AppTextStyles.bodyMedium.copyWith(color: AppColors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget _buildCheckedCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: List.generate(
          data.length,
          (index) => Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedGoalIndex = index;
                });
              },
              child: Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: selectedGoalIndex == index
                      ? AppColors.neonYellow.withValues(alpha: 0.2)
                      : AppColors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: selectedGoalIndex == index
                        ? AppColors.neonYellow
                        : Colors.transparent,
                    width: 2,
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      data[index],
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: selectedGoalIndex == index
                            ? AppColors.neonYellow
                            : AppColors.dark,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Icon(
                      selectedGoalIndex == index
                          ? Icons.radio_button_checked
                          : Icons.radio_button_off_outlined,
                      color: selectedGoalIndex == index
                          ? AppColors.neonYellow
                          : AppColors.dark,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
