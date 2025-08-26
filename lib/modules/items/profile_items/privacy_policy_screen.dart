import 'package:fitbody_app_ui/config/route/app_route.dart';
import 'package:fitbody_app_ui/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark,
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar,
            const SizedBox(height: 10),
            Expanded(child: _buildPrivacyContent),
          ],
        ),
      ),
    );
  }

  get _buildAppBar {
    return AppBar(
      leading: GestureDetector(
        onTap: () => Get.toNamed(AppRoute.profileScreen),
        child: Icon(Icons.arrow_back_ios, color: AppColors.white),
      ),
      backgroundColor: AppColors.dark,
      title: Text(
        'Privacy Policy',
        style: AppTextStyles.bodyLarge.copyWith(color: AppColors.neonYellow),
      ),
      centerTitle: false,
    );
  }

  get _buildPrivacyContent {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: Text(
        '''FitBody Privacy Policy

Effective Date: [Insert Date]

At FitBody, your privacy is important to us. This Privacy Policy explains how we collect, use, and protect your information when you use our app. By using FitBody, you agree to the practices described below.

1. Information We Collect
- Personal Information: Name, email, and account details you provide.
- Fitness Data: Workout history, goals, and activity data you enter.
- Usage Data: App usage, device information, and analytics to improve FitBody.

2. How We Use Your Information
- Provide and improve workout plans and app features.
- Track your progress and personalize your fitness experience.
- Send important updates, notifications, or promotional messages (if you consent).
- Ensure security and prevent misuse of the app.

3. Sharing Your Information
We do not sell or rent your personal data. We may share information:
- With trusted service providers for app functionality.
- When required by law or to protect our rights.

4. Data Security
We implement reasonable measures to protect your data from unauthorized access, alteration, or disclosure.

5. Your Choices
- You can update or delete your account and personal information.
- You can opt out of receiving promotional notifications at any time.

6. Children’s Privacy
FitBody is not intended for children under 13. We do not knowingly collect personal information from children.

7. Changes to This Policy
We may update this Privacy Policy occasionally. Updates will be posted in the app.

8. Contact Us
If you have any questions, please contact us at: [Insert Contact Email]''',
        style: AppTextStyles.bodyMedium.copyWith(
          color: AppColors.white,
          height: 1.5,
        ),
      ),
    );
  }
}
