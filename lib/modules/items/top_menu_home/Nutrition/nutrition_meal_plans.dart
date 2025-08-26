import 'package:fitbody_app_ui/config/route/app_route.dart';
import 'package:fitbody_app_ui/config/theme/app_theme.dart';
import 'package:fitbody_app_ui/modules/items/top_menu_home/Nutrition/meal_plans.dart';
import 'package:fitbody_app_ui/widgets/button_blur_widget.dart';
import 'package:fitbody_app_ui/widgets/neumorphic_check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class NutritionMealPlansDetail extends StatelessWidget {
  const NutritionMealPlansDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppColors.dark, body: _buildBody);
  }

  Widget get _buildBody {
    return Container(
      color: AppColors.dark,
      child: NestedScrollView(
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [_buildSliverAppBar(context)];
        },
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [_buildMealPlansBody],
          ),
        ),
      ),
    );
  }

  _buildSliverAppBar(BuildContext context) {
    List<IconData> iconActions = [
      Icons.search_outlined,
      Icons.notifications_sharp,
      Icons.person,
    ];

    List<VoidCallback> iconActionsCallbacks = [
      () => Get.offAndToNamed(AppRoute.searchScreen),
      () => Get.offAndToNamed(AppRoute.notificationScreen),
      () => Get.offAndToNamed(AppRoute.profileScreen),
    ];
    return SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.dark,
      pinned: true,
      floating: false,
      expandedHeight: 70,
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Icon(
          Icons.arrow_left_sharp,
          color: AppColors.neonYellow,
          size: 38,
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Meal plans',
            style: AppTextStyles.titleMedium.copyWith(
              color: AppColors.primaryPurple,
            ),
          ),
        ],
      ),
      centerTitle: false,
      actions: List.generate(
        iconActions.length,
        (index) => Padding(
          padding: EdgeInsets.only(right: 8),
          child: InkWell(
            onTap: iconActionsCallbacks[index],
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
              ),
              child: Icon(iconActions[index], color: AppColors.primaryPurple),
            ),
          ),
        ),
      ),
    );
  }

  get _buildMealPlansBody {
    return Column(
      spacing: 20,
      children: [
        _buildDietaryPreferences,
        _buildAllergies,
        _buildMealTypes,
        BlurredButton(
          width: 200,
          label: 'Next',
          onPressed: () {
            Get.to(() => const NutritionMealPlansDetailNext());
          },
        ),
      ],
    );
  }

  get _buildDietaryPreferences {
    return Column(
      children: [
        DietaryPreferencesWidget(
          title: 'Dietary Preferences',
          subtitle: 'What are your dietary preferences?',
          firstColumnOptions: ['Vegetarian', 'No preferences', 'Gluten-Free'],
          secondColumnOptions: ['Vegan', 'Keto', 'Paleo'],
        ),
      ],
    );
  }

  get _buildAllergies {
    return Column(
      children: [
        DietaryPreferencesWidget(
          title: 'Allergies',
          subtitle: 'Do you have any food allergies we should know about?',
          firstColumnOptions: ['Nuts', 'No preferences', 'Shellfish'],
          secondColumnOptions: ['Eggs', 'No allergies'],
        ),
      ],
    );
  }

  get _buildMealTypes {
    return Column(
      children: [
        DietaryPreferencesWidget(
          title: 'Meal Types',
          subtitle: 'Which meals do you want to plan?',
          firstColumnOptions: ['Breakfast', 'Lunch'],
          secondColumnOptions: ['Dinner', 'Snacks'],
        ),
      ],
    );
  }
}

class NutritionMealPlansDetailNext extends StatefulWidget {
  const NutritionMealPlansDetailNext({super.key});

  @override
  State<NutritionMealPlansDetailNext> createState() =>
      _NutritionMealPlansDetailNextState();
}

class _NutritionMealPlansDetailNextState
    extends State<NutritionMealPlansDetailNext> {
  bool _isLoading = false;

  Future<void> _createMealPlans() async {
    setState(() {
      _isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _isLoading = false;
    });

    if (mounted) {
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (context) => MealPlans()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppColors.dark, body: _buildBody);
  }

  Widget get _buildBody {
    return Container(
      color: AppColors.dark,
      child: NestedScrollView(
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [_buildSliverAppBar(context)];
        },
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [_buildMealPlansBody],
          ),
        ),
      ),
    );
  }

  _buildSliverAppBar(BuildContext context) {
    List<IconData> iconActions = [
      Icons.search_outlined,
      Icons.notifications_sharp,
      Icons.person,
    ];

    List<VoidCallback> iconActionsCallbacks = [
      () => Get.offAndToNamed(AppRoute.searchScreen),
      () => Get.offAndToNamed(AppRoute.notificationScreen),
      () => Get.offAndToNamed(AppRoute.profileScreen),
    ];
    return SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.dark,
      pinned: true,
      floating: false,
      expandedHeight: 70,
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Icon(
          Icons.arrow_left_sharp,
          color: AppColors.neonYellow,
          size: 38,
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Meal plans',
            style: AppTextStyles.titleMedium.copyWith(
              color: AppColors.primaryPurple,
            ),
          ),
        ],
      ),
      centerTitle: false,
      actions: List.generate(
        iconActions.length,
        (index) => Padding(
          padding: EdgeInsets.only(right: 8),
          child: InkWell(
            onTap: iconActionsCallbacks[index],
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
              ),
              child: Icon(iconActions[index], color: AppColors.primaryPurple),
            ),
          ),
        ),
      ),
    );
  }

  get _buildMealPlansBody {
    return Column(
      spacing: 20,
      children: [
        _buildDietaryPreferences,
        _buildAllergies,
        _buildMealTypes,
        _isLoading
            ? SpinKitWave(color: AppColors.primaryPurple, size: 80)
            : BlurredButton(
                width: 200,
                label: 'Create',
                onPressed: _createMealPlans,
              ),
      ],
    );
  }

  get _buildDietaryPreferences {
    return Column(
      children: [
        DietaryPreferencesWidget(
          title: 'Caloric Goal',
          subtitle: 'What is your daily caloric intake goal?',
          firstColumnOptions: [
            'Less than 1500 calories',
            '1500-2000 calories',
            'More than 2000 calories',
            "Not sure/Don't have a goal",
          ],
          // null
          secondColumnOptions: [],
        ),
      ],
    );
  }

  get _buildAllergies {
    return Column(
      children: [
        DietaryPreferencesWidget(
          title: 'Cooking Time Preference',
          subtitle: 'How much time are you willing to spend cooking each meal?',
          firstColumnOptions: [
            'Less than 15 minutes',
            '15-30 minutes',
            'More than 30 minutes',
          ],
          secondColumnOptions: [],
        ),
      ],
    );
  }

  get _buildMealTypes {
    return Column(
      children: [
        DietaryPreferencesWidget(
          title: 'Number of Servings',
          subtitle: 'How many servings do you need per meal?',
          firstColumnOptions: ['1', '2'],
          secondColumnOptions: ['3-4', '5 or more'],
        ),
      ],
    );
  }
}

/// ========= check list widget =========

class DietaryPreferencesWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<String>? firstColumnOptions;
  final List<String>? secondColumnOptions;

  const DietaryPreferencesWidget({
    super.key,
    this.title = 'Title name',
    this.subtitle = 'Description',
    this.firstColumnOptions,
    this.secondColumnOptions,
  });

  Widget _buildOptionRow(String label) {
    return Row(
      children: [
        NeumorphicCheckBoxWidget(),
        SizedBox(width: 10),
        Text(
          label,
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.primaryPurple,
          ),
        ),
      ],
    );
  }

  Widget _buildColumn(List<String> options) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: options
          .map(
            (option) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: _buildOptionRow(option),
            ),
          )
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.titleMedium.copyWith(
            color: AppColors.neonYellow,
          ),
        ),
        Text(
          subtitle,
          style: AppTextStyles.descriptionSmall.copyWith(
            color: AppColors.white,
          ),
        ),
        SizedBox(height: 14),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildColumn(firstColumnOptions!),
            _buildColumn(secondColumnOptions!),
          ],
        ),
      ],
    );
  }
}
