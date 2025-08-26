import 'package:fitbody_app_ui/config/route/app_route.dart';
import 'package:fitbody_app_ui/config/theme/app_theme.dart';
import 'package:fitbody_app_ui/widgets/button_blur_widget.dart';
import 'package:fitbody_app_ui/widgets/custom_text_fields_pwd.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordSetting extends StatelessWidget {
  const PasswordSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(backgroundColor: AppColors.dark, body: _buildBody),
    );
  }

  get _buildBody => Column(children: [_buildAppBar, _buildFormTextField]);

  get _buildAppBar {
    return AppBar(
      leading: GestureDetector(
        onTap: () => Get.offAndToNamed(AppRoute.settingProfileScreen),
        child: Icon(Icons.arrow_back_ios, color: AppColors.white),
      ),
      backgroundColor: AppColors.dark,
      title: Text(
        'Password Settings',
        style: AppTextStyles.bodyLarge.copyWith(color: AppColors.neonYellow),
      ),
      centerTitle: false,
    );
  }

  get _buildFormTextField {
    final currentPasswordController = TextEditingController();
    final newPasswordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25, top: 40),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Current Password
            _buildPasswordField(
              label: 'Current Password',
              controller: currentPasswordController,
              hintText: 'current password',
            ),

            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Forgot password?',
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.white,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),

            const SizedBox(height: 40),

            // New Password
            _buildPasswordField(
              label: 'New Password',
              controller: newPasswordController,
              hintText: 'new password',
            ),

            const SizedBox(height: 30),

            // Confirm Password
            _buildPasswordField(
              label: 'Confirm Password',
              controller: confirmPasswordController,
              hintText: 'confirm password',
            ),
            SizedBox(height: 30),
            BlurredButton(label: 'Change Password', onPressed: () {}),
          ],
        ),
      ),
    );
  }

  // Helper method for password field section
  Widget _buildPasswordField({
    required String label,
    required TextEditingController controller,
    required String hintText,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.bodyMedium.copyWith(color: AppColors.white),
        ),
        const SizedBox(height: 10),
        PasswordInput(textEditingController: controller, hintText: hintText),
      ],
    );
  }
}
