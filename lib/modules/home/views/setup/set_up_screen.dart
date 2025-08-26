import 'package:fitbody_app_ui/config/appassets/app_assets.dart';
import 'package:fitbody_app_ui/config/route/app_route.dart';
import 'package:fitbody_app_ui/config/theme/app_theme.dart';
import 'package:fitbody_app_ui/widgets/button_blur_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SetUpScreen extends StatelessWidget {
  const SetUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody);
  }

  get _buildBody {
    return Column(
      children: [
        Container(
          height: 550,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppAssets.setUpBG),
              fit: BoxFit.cover,
            ),
          ),
        ),

        Expanded(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(color: AppColors.dark),
            child: Padding(
              padding: const EdgeInsets.only(top: 30, left: 25, right: 25),
              child: Column(
                spacing: 14,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    'Consistency Is\nthe Key To progress.\nDon\'t Give Up!',
                    style: AppTextStyles.titleLarge.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    'Success is not the key to happiness. Happiness is the key to success. If you love what you are doing, you will be successful.',
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  BlurredButton(
                    label: 'Get Started',
                    onPressed: () {
                      Get.toNamed(AppRoute.setUpGender);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
