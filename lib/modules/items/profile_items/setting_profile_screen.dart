import 'package:fitbody_app_ui/config/route/app_route.dart';
import 'package:fitbody_app_ui/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingProfileScreen extends StatelessWidget {
  const SettingProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(backgroundColor: AppColors.dark, body: _buildBody),
    );
  }

  Widget get _buildBody {
    return NestedScrollView(
      physics: const BouncingScrollPhysics(),
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [_buildSliverAppBar];
      },
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // any other widgets
            _buildSettingsTile,
          ],
        ),
      ),
    );
  }

  get _buildSliverAppBar {
    return SliverAppBar(
      backgroundColor: AppColors.dark,
      floating: false,
      pinned: true,
      leading: GestureDetector(
        onTap: () => Get.toNamed(AppRoute.profileScreen),
        child: Icon(
          Icons.arrow_back_ios_new_outlined,
          color: AppColors.primaryPurple,
        ),
      ),
      title: Text(
        'Settings',
        style: AppTextStyles.titleMedium.copyWith(
          color: AppColors.primaryPurple,
        ),
      ),
      centerTitle: false,
    );
  }

  get _buildSettingsTile {
    List<Map<String, dynamic>> settings = [
      {
        'title': 'Notification Setting',
        'icon': Icons.notifications,
        'onTap': () => Get.toNamed(AppRoute.notificationSetting),
      },
      {
        'title': 'Password Setting',
        'icon': Icons.lock,
        'onTap': () => Get.toNamed(AppRoute.passwordSetting),
      },
      // {
      //   'title': 'Delete Account',
      //   'icon': Icons.delete,
      //   'onTap': () => Get.toNamed(AppRoute.deleteAccountSetting),
      // },
    ];
    return Column(
      spacing: 14,
      children: List.generate(
        settings.length,
        (index) => ListTile(
          leading: Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: AppColors.secondaryPurple,
              shape: BoxShape.circle,
            ),
            child: Icon(settings[index]['icon'], color: AppColors.white),
          ),
          title: Text(
            settings[index]['title'],
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.primaryPurple,
            ),
          ),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            size: 28,
            color: AppColors.primaryPurple,
          ),
          onTap: () => settings[index]['onTap'](),
        ),
      ),
    );
  }
}
