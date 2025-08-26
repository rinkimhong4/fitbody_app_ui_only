import 'package:cached_network_image/cached_network_image.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:fitbody_app_ui/config/route/app_route.dart';
import 'package:fitbody_app_ui/config/theme/app_theme.dart';
import 'package:fitbody_app_ui/widgets/button_blur_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Define a model for onboarding data
class OnboardingItem {
  final String illustration;
  final String title;
  final String text;

  OnboardingItem({
    required this.illustration,
    required this.title,
    required this.text,
  });
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  double currentPage = 0;
  final PageController _pageController = PageController();

  // Define constants for consistent styling
  static const double _padding = 24.0;
  static const double _dotSize = 8.0;
  static const double _spacing = 16.0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (currentPage < demoData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeIn,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: demoData.length,
            onPageChanged: (value) {
              setState(() {
                currentPage = value.toDouble();
              });
            },
            itemBuilder: (context, index) => CachedNetworkImage(
              imageUrl: demoData[index].illustration,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator.adaptive()),
              errorWidget: (context, url, error) => const Center(
                child: Icon(
                  Icons.image_not_supported,
                  size: 48,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: _padding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.offNamed(AppRoute.signin);
                        },
                        child: Text(
                          'Skip',
                          style: AppTextStyles.bodySmall.copyWith(
                            color: AppColors.primaryPurple,
                          ),
                          semanticsLabel: 'Skip onboarding',
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(flex: 2),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: _padding),
                  child: Text(
                    demoData[currentPage.round()].title,
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                    semanticsLabel: demoData[currentPage.round()].title,
                  ),
                ),
                const SizedBox(height: _spacing),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: _padding),
                  child: Text(
                    demoData[currentPage.round()].text,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge!.copyWith(color: Colors.white),
                    textAlign: TextAlign.center,
                    semanticsLabel: demoData[currentPage.round()].text,
                  ),
                ),
                const Spacer(),
                DotsIndicator(
                  dotsCount: demoData.length,
                  position: currentPage,
                  decorator: DotsDecorator(
                    activeColor: Colors.white,
                    color: Colors.white.withValues(alpha: 0.3),
                    size: const Size(_dotSize, 5.0),
                    activeSize: const Size(_dotSize, 5.0),
                    spacing: const EdgeInsets.symmetric(horizontal: 6.0),
                  ),
                ),
                const SizedBox(height: _spacing),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: _padding),
                  child: BlurredButton(
                    label: currentPage == demoData.length - 1
                        ? "Get Started"
                        : "Next",
                    onPressed: currentPage == demoData.length - 1
                        ? () => Get.offNamed(AppRoute.signin)
                        : _nextPage,
                  ),
                ),
                const SizedBox(height: _spacing * 2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Typed onboarding data
final List<OnboardingItem> demoData = [
  OnboardingItem(
    illustration:
        "https://images.pexels.com/photos/1431282/pexels-photo-1431282.jpeg",
    title: "Achieve Your Goals",
    text:
        "Stay motivated with custom workout plans\nand daily fitness tracking.",
  ),
  OnboardingItem(
    illustration:
        "https://images.pexels.com/photos/852500/pexels-photo-852500.jpeg",
    title: "Nutrition Matters",
    text: "Get personalized meal suggestions\nfor a healthier, stronger you.",
  ),
  OnboardingItem(
    illustration:
        "https://images.pexels.com/photos/8555348/pexels-photo-8555348.jpeg",
    title: "Track Your Progress",
    text:
        "Monitor your workouts, body stats,\nand see your transformation over time.",
  ),
];
