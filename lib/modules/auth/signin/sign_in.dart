import 'package:fitbody_app_ui/config/route/app_route.dart';
import 'package:fitbody_app_ui/widgets/button_blur_widget.dart';
import 'package:fitbody_app_ui/widgets/socialbutton.dart';
import 'package:flutter/material.dart';
import 'package:fitbody_app_ui/config/theme/app_theme.dart';
import 'package:get/get.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

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
      child: Column(
        children: [_buildAppBar, _buildParagraph, _buildForm(context)],
      ),
    );
  }

  get _buildAppBar {
    return AppBar(
      backgroundColor: AppColors.dark,
      leading: GestureDetector(
        onTap: () => Get.offAndToNamed(AppRoute.signup),
        child: Icon(
          Icons.arrow_left_outlined,
          size: 32,
          color: AppColors.neonYellow,
        ),
      ),
      title: Text(
        'Sign In',
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
            'Welcome',
            style: AppTextStyles.titleMedium.copyWith(color: AppColors.white),
          ),
          Text(
            'Welcome to FitBody, your companion for a healthier and fitter lifestyle. Sign in to continue your journey!',
            style: AppTextStyles.bodySmall.copyWith(color: AppColors.white),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  _buildForm(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 25, right: 25),
      child: Column(
        children: [
          Form(
            child: Column(
              children: [
                TextFormField(
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
                SizedBox(height: 20),
                TextFormField(
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  obscuringCharacter: '*',

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
                    hintText: 'Enter your password',
                    prefixIcon: Icon(Icons.lock_outline),
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
                    labelText: 'Password',
                    labelStyle: TextStyle(color: AppColors.neonYellow),
                    floatingLabelStyle: TextStyle(color: AppColors.neonYellow),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Get.toNamed(AppRoute.forgotPwd);
                    },
                    child: Text(
                      'Forgot Password?',
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.neonYellow,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                BlurredButton(
                  label: 'Sign In',
                  onPressed: () {
                    // Get.offAndToNamed(AppRoute.home);
                    Get.offAndToNamed(AppRoute.setUpScreen);
                  },
                ),
                SizedBox(height: 30),
                Text(
                  'or continue with',
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.neonYellow,
                  ),
                ),
                SizedBox(height: 30),
                Column(
                  spacing: 14,
                  children: [
                    SocialButton(
                      onTap: () {},
                      title: 'Facebook',
                      color: Colors.blue,
                    ),
                    SocialButton(
                      onTap: () {},
                      title: 'Google',
                      color: Colors.red,
                    ),
                    SocialButton(
                      onTap: () {},
                      title: 'Apple',
                      color: Colors.blueGrey,
                    ),
                  ],
                ),
                SizedBox(height: 80),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.offAndToNamed(AppRoute.signup);
                      },
                      child: Text(
                        " Sign Up",
                        style: AppTextStyles.bodySmall.copyWith(
                          color: AppColors.neonYellow,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
