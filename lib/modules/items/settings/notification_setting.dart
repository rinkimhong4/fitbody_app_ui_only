import 'package:fitbody_app_ui/config/route/app_route.dart';
import 'package:fitbody_app_ui/config/theme/app_theme.dart';
import 'package:fitbody_app_ui/widgets/custom_switch_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationSetting extends StatelessWidget {
  const NotificationSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppColors.dark, body: _buildBody);
  }

  get _buildBody => Column(children: [_buildAppBar, _buildListTitle]);

  get _buildAppBar {
    return AppBar(
      leading: GestureDetector(
        onTap: () => Get.offAndToNamed(AppRoute.settingProfileScreen),
        child: Icon(Icons.arrow_back_ios, color: AppColors.white),
      ),
      backgroundColor: AppColors.dark,
      title: Text(
        'Notification Setting',
        style: AppTextStyles.bodyLarge.copyWith(color: AppColors.primaryPurple),
      ),
      centerTitle: false,
    );
  }

  get _buildListTitle {
    final List<Map<String, dynamic>> data = [
      {"title": "General Notification", "isActive": true},
      {"title": "Sound", "isActive": false},
      {"title": "Vibrate", "isActive": true},
      {"title": "Lock Screen", "isActive": false},
      {"title": "Reminders", "isActive": true},
    ];

    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 25, right: 25),
      child: Column(
        children: data.map((item) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item["title"],
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.white,
                  ),
                ),
                CustomSwitchWidget(
                  isActive: item["isActive"],
                  onChanged: (value) {
                    item["isActive"] = value;
                    // debugPrint("${item["title"]} switch changed to: $value");
                  },
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
