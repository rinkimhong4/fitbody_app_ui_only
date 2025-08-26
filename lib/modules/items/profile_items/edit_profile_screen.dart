import 'package:fitbody_app_ui/config/route/app_route.dart';
import 'package:fitbody_app_ui/config/theme/app_theme.dart';
import 'package:fitbody_app_ui/widgets/custom_buttom.dart';
import 'package:fitbody_app_ui/widgets/custom_text_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

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
        padding: const EdgeInsets.symmetric(horizontal: 24),
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [_buildTextField],
        ),
      ),
    );
  }

  get _buildSliverAppBar {
    return SliverAppBar(
      backgroundColor: AppColors.secondaryPurple,
      floating: false,
      // pinned: true,
      expandedHeight: 70,
      leading: GestureDetector(
        onTap: () => Get.toNamed(AppRoute.profileScreen),
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

  get _buildTextField {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Column(
        spacing: 20,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(
            controller: TextEditingController(),
            // controller: nameController,
            label: 'Full Name',
            hintText: 'Madison Smith',
          ),
          CustomTextField(
            controller: TextEditingController(),
            // controller: nameController,
            label: 'Email',
            hintText: 'madisons@example.com',
          ),
          CustomTextField(
            controller: TextEditingController(),
            // controller: nameController,
            label: 'Mobile Number',
            hintText: '+855 567 89000',
          ),
          CustomTextField(
            controller: TextEditingController(),
            // controller: nameController,
            label: 'Date of Birth',
            hintText: '01 / 04 / 199X',
          ),
          CustomTextField(
            controller: TextEditingController(),
            // controller: nameController,
            label: 'Weight',
            hintText: '70 kg',
          ),
          CustomTextField(
            controller: TextEditingController(),
            // controller: nameController,
            label: 'Height',
            hintText: '170 cm',
          ),
          CustomActionButtons(onTap: () {}, title: 'Update Profile'),
        ],
      ),
    );
  }
}
