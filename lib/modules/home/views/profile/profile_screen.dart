import 'package:fitbody_app_ui/config/route/app_route.dart';
import 'package:fitbody_app_ui/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:panara_dialogs/panara_dialogs.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppColors.dark, body: _buildBody);
  }

  Widget get _buildBody {
    return NestedScrollView(
      physics: const BouncingScrollPhysics(),
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [_buildSliverAppBar];
      },
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [_buildListTitle],
        ),
      ),
    );
  }

  get _buildSliverAppBar {
    return SliverAppBar(
      backgroundColor: AppColors.secondaryPurple,
      floating: false,
      pinned: true,
      expandedHeight: 70,
      leading: GestureDetector(
        onTap: () => Get.toNamed(AppRoute.home),
        child: Icon(Icons.arrow_back_ios_new_outlined, color: AppColors.white),
      ),
      title: Text(
        'Hi, Madison',
        style: AppTextStyles.titleMedium.copyWith(color: AppColors.white),
      ),
      centerTitle: false,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(250),
        child: SizedBox(
          height: 250,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Column(
                spacing: 8,
                children: [
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: Container(
                        width: 145,
                        height: 145,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              'https://media.istockphoto.com/id/479009174/photo/silhouette-of-a-strong-fighter.jpg?s=612x612&w=0&k=20&c=EE1h9Uhh7UuPTOAo5UGwdh64O7L_jytH9ZSO3SnYbTk=',
                            ),
                            fit: BoxFit.cover,
                          ),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.neonYellow,
                            width: 3,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            'Madison',
                            style: AppTextStyles.titleLarge.copyWith(
                              color: AppColors.white,
                            ),
                          ),
                          Text(
                            'sample@gmail.com',
                            style: AppTextStyles.bodySmall.copyWith(
                              color: AppColors.white,
                            ),
                          ),
                          Text(
                            'Birthday: April 1st',
                            style: AppTextStyles.bodyMedium.copyWith(
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: -20,
                left: 20,
                right: 20,
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: AppColors.primaryPurple,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildStatColumn('60 Kg', 'Weight'),
                      _buildDivider(),
                      _buildStatColumn('20', 'Years Old'),
                      _buildDivider(),
                      _buildStatColumn('1.68', 'Height'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildStatColumn(String value, String label) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            label,
            style: AppTextStyles.descriptionSmall.copyWith(
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }

  _buildDivider() {
    return Container(width: 2, height: 40, color: Colors.white);
  }

  get _buildListTitle {
    final List<Map<String, dynamic>> profileListDatas = [
      {
        'title': 'Profile',
        'leading': Icons.person,
        'trailing': Icons.arrow_forward_ios,
        'onTap': () => Get.toNamed(AppRoute.editProfileScreen),
      },
      {
        'title': 'Favorite',
        'leading': Icons.star_rate_rounded,
        'trailing': Icons.arrow_forward_ios,
        'onTap': () => Get.toNamed(AppRoute.favoriteProfileScreen),
      },
      {
        'title': 'Privacy Policy',
        'leading': Icons.privacy_tip,
        'trailing': Icons.arrow_forward_ios,
        'onTap': () => Get.toNamed(AppRoute.privacyPolicyScreen),
      },
      {
        'title': 'Settings',
        'leading': Icons.settings,
        'trailing': Icons.arrow_forward_ios,
        'onTap': () => Get.toNamed(AppRoute.settingProfileScreen),
      },
      {
        'title': 'Help',
        'leading': Icons.help,
        'trailing': Icons.arrow_forward_ios,
        'onTap': () => Get.toNamed(AppRoute.helpProfileScreen),
      },
      {
        'title': 'Logout',
        'leading': Icons.logout,
        'trailing': Icons.arrow_forward_ios,
        'onTap': () {
          PanaraConfirmDialog.show(
            context,
            title: "Logout",
            message: "Are you sure you want to log out?",
            confirmButtonText: "Yes",
            cancelButtonText: "No",
            panaraDialogType: PanaraDialogType.normal,
            barrierDismissible: false,
            onTapCancel: () => Navigator.pop(context),
            onTapConfirm: () {
              Navigator.pop(context);
              Get.offAllNamed(AppRoute.home);
            },
          );
        },
      },
    ];

    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Column(
        spacing: 10,
        children: List.generate(profileListDatas.length, (index) {
          final item = profileListDatas[index];
          return ListTile(
            leading: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: AppColors.primaryPurple,
                shape: BoxShape.circle,
              ),
              child: Icon(item['leading'], color: AppColors.white, size: 32),
            ),
            title: Text(
              item['title'],
              style: AppTextStyles.bodyMedium.copyWith(color: AppColors.white),
            ),
            trailing: Icon(item['trailing'], color: AppColors.white),
            onTap: item['onTap'],
          );
        }),
      ),
    );
  }
}
