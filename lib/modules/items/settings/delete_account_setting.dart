import 'package:fitbody_app_ui/config/route/app_route.dart';
import 'package:fitbody_app_ui/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeleteAccountSetting extends StatelessWidget {
  const DeleteAccountSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppColors.dark, body: _buildBody);
  }

  get _buildBody => Column(children: [_buildAppBar]);

  get _buildAppBar {
    return AppBar(
      leading: GestureDetector(
        onTap: () => Get.offAndToNamed(AppRoute.settingProfileScreen),
        child: Icon(Icons.arrow_back_ios, color: AppColors.white),
      ),
      backgroundColor: AppColors.dark,
      title: Text(
        'delete account Settings',
        style: AppTextStyles.bodyLarge.copyWith(color: AppColors.neonYellow),
      ),
      centerTitle: false,
    );
  }
}
