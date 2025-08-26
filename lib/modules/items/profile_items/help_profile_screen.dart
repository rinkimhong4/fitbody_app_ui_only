import 'package:fitbody_app_ui/config/route/app_route.dart';
import 'package:fitbody_app_ui/config/theme/app_theme.dart';
import 'package:fitbody_app_ui/widgets/custom_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class HelpProfileScreen extends StatelessWidget {
  const HelpProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(backgroundColor: AppColors.dark, body: _buildBody),
    );
  }

  get _buildBody {
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
          children: [_buildAppBody],
        ),
      ),
    );
  }

  SliverAppBar get _buildSliverAppBar {
    return SliverAppBar(
      backgroundColor: AppColors.secondaryPurple,
      floating: false,
      pinned: true,
      leading: GestureDetector(
        onTap: () => Get.toNamed(AppRoute.profileScreen),
        child: Icon(Icons.arrow_back_ios_new_outlined, color: AppColors.white),
      ),
      title: Text(
        'Help & FAQs',
        style: AppTextStyles.titleMedium.copyWith(color: AppColors.white),
      ),
      centerTitle: false,
    );
  }

  Widget get _buildAppBody {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Column(
          children: [
            Text(
              'How can we help you?',
              style: AppTextStyles.bodyMedium.copyWith(color: AppColors.white),
            ),
            const SizedBox(height: 20),
            AnimatedRoundedTabbarFilled(
              tabWidth: 180,
              tabs: const ['FAQ', 'Contact Us'],
              tabContents: [
                // FAQ Section with sub-tabs
                AnimatedRoundedTabbarFilled(
                  tabs: const ['General', 'Account', 'Services'],
                  tabContents: [
                    _buildFaqGeneral,
                    _buildFaqAccount,
                    _buildFaqServices,
                  ],
                ),
                // Contact Us Section
                _buildContactUs,
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget get _buildFaqGeneral {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.primaryPurple,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildFaqItem(
              'What is Fitbody App?',
              'Fitbody App is a fitness application designed to help you achieve your health and wellness goals through personalized workout plans, nutrition tracking, and progress monitoring.',
            ),
            _buildFaqItem(
              'How do I get started?',
              'To get started, simply download the app, create an account, and complete the initial setup process. You will be asked to provide information about your fitness level, goals, and preferences to create a personalized plan.',
            ),
            _buildFaqItem(
              'Is the app free to use?',
              'The app offers both free and premium features. The free version includes basic workout plans and tracking, while the premium subscription unlocks advanced features such as personalized coaching, meal plans, and more.',
            ),
          ],
        ),
      ),
    );
  }

  Widget get _buildFaqAccount {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.primaryPurple,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildFaqItem(
              'How do I reset my password?',
              'You can reset your password by navigating to the login screen and tapping on the "Forgot Password" link. Follow the instructions sent to your registered email address to create a new password.',
            ),
            _buildFaqItem(
              'How do I update my profile information?',
              'To update your profile, go to the "Profile" section of the app. Here, you can edit your personal details, fitness goals, and other preferences.',
            ),
            _buildFaqItem(
              'How do I cancel my subscription?',
              'You can manage your subscription through the app store where you made the purchase (e.g., Apple App Store or Google Play Store). Navigate to your subscriptions and select "Fitbody App" to cancel.',
            ),
          ],
        ),
      ),
    );
  }

  Widget get _buildFaqServices {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.primaryPurple,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildFaqItem(
              'What kind of workout plans are available?',
              'We offer a wide range of workout plans, including strength training, cardio, yoga, and HIIT. Each plan is tailored to your fitness level and goals.',
            ),
            _buildFaqItem(
              'Can I customize my workout plan?',
              'Yes, you can customize your workout plan by adding or removing exercises, adjusting the intensity, and changing the duration of your workouts.',
            ),
            _buildFaqItem(
              'Does the app provide nutrition guidance?',
              'Yes, our premium subscription includes personalized meal plans and nutrition tracking to help you maintain a healthy diet.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFaqItem(String question, String answer) {
    return ExpansionTile(
      iconColor: AppColors.white,
      collapsedIconColor: AppColors.white,
      title: Text(
        question,
        style: AppTextStyles.bodyMedium.copyWith(color: AppColors.white),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: Text(
            answer,
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.white.withValues(alpha: 0.8),
            ),
          ),
        ),
      ],
    );
  }

  Widget get _buildContactUs {
    return SingleChildScrollView(child: _buildContactUsTab());
  }

  Widget _buildContactUsTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          _buildContactUsHeader,
          Text(
            'Email us or use the form below to get in touch.',
            style: AppTextStyles.bodyMedium.copyWith(color: AppColors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          _buildContactForm(),
        ],
      ),
    );
  }

  Widget _buildContactForm() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primaryPurple,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          _buildTextField('Your Name'),
          SizedBox(height: 16),
          _buildTextField('Your Email'),
          SizedBox(height: 16),
          _buildTextField('Subject'),
          SizedBox(height: 16),
          _buildTextField('Your Message', maxLines: 5),
          SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              Get.snackbar(
                'Message Sent',
                'Thank you for contacting us! We will get back to you shortly.',
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: AppColors.secondaryPurple,
                colorText: AppColors.white,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryPurple,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              shadowColor: AppColors.primaryPurple,
              elevation: 3,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Text(
                'Send Message',
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  get _buildContactUsHeader {
    List<Map<String, dynamic>> items = [
      {
        'title': 'Customer service',
        'icon': FontAwesomeIcons.headset,
        'trailing': Icons.arrow_forward_ios,
        'onTap': () => debugPrint("Customer service Tapped"),
        // 'onTap': () => Get.toNamed(AppRoute.home),
      },
      {
        'title': 'Website',
        'icon': FontAwesomeIcons.globe,
        'trailing': Icons.arrow_forward_ios,
        'onTap': () => debugPrint("Website Tapped"),
        // 'onTap': () => Get.toNamed(AppRoute.home),
      },
      {
        'title': 'Whatsapp',
        'icon': FontAwesomeIcons.whatsapp,
        'trailing': Icons.arrow_forward_ios,
        'onTap': () => debugPrint("Whatsapp Tapped"),
        // 'onTap': () => Get.toNamed(AppRoute.home),
      },
      {
        'title': 'Facebook',
        'icon': FontAwesomeIcons.facebook,
        'trailing': Icons.arrow_forward_ios,
        'onTap': () => debugPrint("Facebook Tapped"),
        // 'onTap': () => Get.toNamed(AppRoute.home),
      },
      {
        'title': 'Instagram',
        'icon': FontAwesomeIcons.instagram,
        'trailing': Icons.arrow_forward_ios,
        'onTap': () => debugPrint("Instagram Tapped"),
      },
    ];
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Column(
        spacing: 10,
        children: [
          for (var item in items)
            ListTile(
              leading: Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primaryPurple,
                ),
                child: Icon(item['icon'], color: AppColors.white),
              ),
              title: Text(
                item['title'],
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.white,
                ),
              ),
              trailing: Icon(item['trailing'], color: AppColors.white),
              onTap: item['onTap'],
            ),
        ],
      ),
    );
  }

  Widget _buildTextField(String hint, {int maxLines = 1}) {
    return TextField(
      maxLines: maxLines,
      style: AppTextStyles.bodySmall.copyWith(color: AppColors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: AppTextStyles.bodySmall.copyWith(
          color: AppColors.white.withValues(alpha: 0.5),
        ),
        filled: true,
        fillColor: AppColors.dark.withValues(alpha: (0.5)),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.primaryPurple, width: 1),
        ),
      ),
    );
  }
}

// A simple placeholder screen for navigation purposes
class PlaceholderScreen extends StatelessWidget {
  final String title;
  const PlaceholderScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: AppColors.secondaryPurple,
      ),
      body: Center(
        child: Text(
          'This is the $title',
          style: AppTextStyles.bodyMedium.copyWith(color: AppColors.white),
        ),
      ),
    );
  }
}
