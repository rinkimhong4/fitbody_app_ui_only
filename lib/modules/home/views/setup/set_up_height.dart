import 'package:fitbody_app_ui/config/route/app_route.dart';
import 'package:fitbody_app_ui/config/theme/app_theme.dart';
import 'package:fitbody_app_ui/widgets/height_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SetUpHeight extends StatelessWidget {
  const SetUpHeight({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark,
      body: Column(
        children: [
          _buildAppBar(context),
          _buildTitle(),
          SizedBox(height: 30),
          HeightPickerWidget(),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.dark,
      leading: GestureDetector(
        onTap: () => Get.offAndToNamed(AppRoute.setUpWeight),
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

  Widget _buildTitle() {
    return Column(
      spacing: 14,
      children: [
        SizedBox(height: 20),
        Text(
          "How Height Are You?",
          style: AppTextStyles.titleLarge.copyWith(color: AppColors.neonYellow),
        ),
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 25),
          height: 79,
          width: double.infinity,
          color: AppColors.secondaryPurple,
          child: Text(
            'Please enter your height.',
            style: AppTextStyles.bodyMedium.copyWith(color: AppColors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
