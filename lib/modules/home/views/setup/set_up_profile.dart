import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitbody_app_ui/config/route/app_route.dart';
import 'package:fitbody_app_ui/config/theme/app_theme.dart';
import 'package:fitbody_app_ui/widgets/button_blur_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SetUpProfile extends StatelessWidget {
  const SetUpProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppColors.dark, body: _buildBody);
  }

  get _buildBody {
    return Column(
      children: [_buildAppBar, _buildTitle, _profilePicture, _buildTextField],
    );
  }

  get _buildAppBar {
    return AppBar(
      backgroundColor: AppColors.dark,
      leading: IconButton(
        onPressed: () => Get.offAndToNamed(AppRoute.setUpActivityLevel),
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

  get _buildTitle {
    return Column(
      spacing: 24,
      children: [
        Text(
          "Fill Your Profile",
          style: AppTextStyles.titleLarge.copyWith(color: AppColors.neonYellow),
        ),
        Text(
          'Complete your profile to continue.',
          style: AppTextStyles.bodyMedium.copyWith(color: AppColors.white),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  get _profilePicture {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Center(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.neonYellow, width: 4),
                image: DecorationImage(
                  alignment: Alignment.center,
                  image: CachedNetworkImageProvider(
                    'https://www.shutterstock.com/image-photo/happy-mid-aged-business-man-600nw-2307212331.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
                color: AppColors.secondaryPurple,
                shape: BoxShape.circle,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 50,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.neonYellow,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.edit_outlined, color: AppColors.dark),
              ),
            ),
          ],
        ),
      ),
    );
  }

  get _buildTextField {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 50),
      child: Column(
        children: [
          Form(
            child: Column(
              spacing: 14,
              children: [
                CustomTextField(
                  controller: TextEditingController(),
                  hintText: 'Full Name',
                ),
                CustomTextField(
                  controller: TextEditingController(),
                  hintText: 'Nickname',
                ),
                CustomTextField(
                  controller: TextEditingController(),
                  hintText: 'Email',
                ),
                CustomTextField(
                  controller: TextEditingController(),
                  hintText: 'Phone Number',
                ),
                SizedBox(height: 20),
                BlurredButton(
                  label: 'Start',
                  onPressed: () {
                    Get.offAllNamed(AppRoute.home);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  const CustomTextField({
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.validator,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.neonYellow,
      style: AppTextStyles.bodyLarge.copyWith(color: AppColors.dark),
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 14.0,
        ),
        hintText: hintText,
        hintStyle: AppTextStyles.bodyMedium.copyWith(color: AppColors.dark),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.neonYellow),
          borderRadius: BorderRadius.circular(8.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primaryPurple.withValues(alpha: 0.8),
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.white),
          borderRadius: BorderRadius.circular(8.0),
        ),
        filled: true,
        fillColor: AppColors.white,
      ),
    );
  }
}
