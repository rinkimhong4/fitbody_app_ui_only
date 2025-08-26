import 'package:fitbody_app_ui/config/route/app_route.dart';
import 'package:fitbody_app_ui/config/theme/app_theme.dart';
import 'package:fitbody_app_ui/widgets/button_blur_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPwd extends StatelessWidget {
  const ForgotPwd({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(body: _buildBody(context)),
    );
  }

  _buildBody(BuildContext context) {
    return Container(
      color: AppColors.dark,
      child: Column(children: [_buildAppBar, _buildParagraph, _buildTextForm]),
    );
  }

  get _buildAppBar {
    return AppBar(
      backgroundColor: AppColors.dark,
      leading: GestureDetector(
        onTap: () => Get.offAndToNamed(AppRoute.signin),
        child: Icon(
          Icons.arrow_left_outlined,
          size: 32,
          color: AppColors.neonYellow,
        ),
      ),
      title: Text(
        'Forgotten Password',
        style: AppTextStyles.titleMedium.copyWith(color: AppColors.neonYellow),
      ),
      centerTitle: true,
    );
  }

  get _buildParagraph {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 25, right: 25),
      child: Column(
        spacing: 14,
        children: [
          Text(
            'Reset Your Password',
            style: AppTextStyles.titleMedium.copyWith(color: AppColors.white),
          ),
          Text(
            'Enter your email address below and we\'ll send you instructions to reset your password.',
            style: AppTextStyles.bodySmall.copyWith(color: AppColors.white),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  get _buildTextForm {
    return Padding(
      padding: const EdgeInsets.only(top: 60, left: 25, right: 25),
      child: Column(
        children: [
          Form(
            child: TextFormField(
              enableSuggestions: false,
              autocorrect: false,
              // validator: (value) {
              //   if (value == null || value.isEmpty) {
              //     return 'Please enter your password';
              //   }
              //   return null;
              // },
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.neonYellow,
              ),
              cursorColor: AppColors.neonYellow,
              decoration: InputDecoration(
                hintStyle: TextStyle(color: AppColors.neonYellow),
                fillColor: Colors.white,
                hintText: 'Enter your email',
                prefixIcon: Icon(Icons.email_outlined),
                prefixIconColor: AppColors.neonYellow,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(color: AppColors.neonYellow),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(color: AppColors.neonYellow),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(color: AppColors.neonYellow),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(),
                ),
                labelText: 'Email',
                labelStyle: TextStyle(color: AppColors.neonYellow),
                floatingLabelStyle: TextStyle(color: AppColors.neonYellow),
              ),
            ),
          ),
          SizedBox(height: 30),
          BlurredButton(
            label: 'Continue',
            onPressed: () {
              Get.offAndToNamed(AppRoute.setNewPwd);
            },
          ),
        ],
      ),
    );
  }
}
