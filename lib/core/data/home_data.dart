import 'package:fitbody_app_ui/config/appassets/app_assets.dart';
import 'package:fitbody_app_ui/config/route/app_route.dart';
import 'package:flutter/material.dart';

// this class use for what
class TopMenuItem {
  final String label;
  final IconData icon;
  final String route;

  const TopMenuItem({
    required this.label,
    required this.icon,
    required this.route,
  });
}

class CardDataHomeScreen {
  final String title;
  final String image;
  final String timerText;
  final IconData timerIcon;
  final IconData calorieIcon;
  final String calorieText;

  const CardDataHomeScreen({
    required this.title,
    required this.image,
    required this.timerText,
    required this.timerIcon,
    required this.calorieIcon,
    required this.calorieText,
  });
}

// ===================================================================

// data for top menu
class HomeData {
  static const List<TopMenuItem> homeDataTopMenu = [
    TopMenuItem(
      label: 'Workout',
      icon: Icons.fitness_center_outlined,
      route: AppRoute.workOutScreen,
    ),
    TopMenuItem(
      label: 'Progress Tracking',
      icon: Icons.insert_chart_outlined,
      route: AppRoute.progressTracking,
    ),
    TopMenuItem(
      label: 'Nutrition',
      icon: Icons.restaurant_menu,
      route: AppRoute.nutritionScreen,
    ),
    TopMenuItem(
      label: 'Community',
      icon: Icons.groups_rounded,
      route: AppRoute.communityScreen,
    ),
  ];

  static const List<CardDataHomeScreen> homeDataCard = [
    CardDataHomeScreen(
      title: 'Cardio Blast',
      image:
          'https://images.pexels.com/photos/3757372/pexels-photo-3757372.jpeg?auto=compress&cs=tinysrgb&w=600',
      timerText: '25 min',
      timerIcon: Icons.timer,
      calorieIcon: Icons.local_fire_department,
      calorieText: '280 cal',
    ),
    CardDataHomeScreen(
      title: 'Strength Training',
      image:
          'https://images.pexels.com/photos/1552242/pexels-photo-1552242.jpeg?auto=compress&cs=tinysrgb&w=600',
      timerText: '40 min',
      timerIcon: Icons.timer,
      calorieIcon: Icons.local_fire_department,
      calorieText: '450 cal',
    ),
    CardDataHomeScreen(
      title: 'Yoga Flow',
      image:
          'https://images.pexels.com/photos/3823039/pexels-photo-3823039.jpeg?auto=compress&cs=tinysrgb&w=600',
      timerText: '50 min',
      timerIcon: Icons.timer,
      calorieIcon: Icons.local_fire_department,
      calorieText: '180 cal',
    ),
    CardDataHomeScreen(
      title: 'HIIT Workout',
      image:
          'https://images.pexels.com/photos/4761794/pexels-photo-4761794.jpeg?auto=compress&cs=tinysrgb&w=600',
      timerText: '20 min',
      timerIcon: Icons.timer,
      calorieIcon: Icons.local_fire_department,
      calorieText: '320 cal',
    ),
    CardDataHomeScreen(
      title: 'Pilates',
      image:
          'https://images.pexels.com/photos/4324020/pexels-photo-4324020.jpeg?auto=compress&cs=tinysrgb&w=600',
      timerText: '35 min',
      timerIcon: Icons.timer,
      calorieIcon: Icons.local_fire_department,
      calorieText: '220 cal',
    ),
    CardDataHomeScreen(
      title: 'Cycling',
      image:
          'https://images.pexels.com/photos/276517/pexels-photo-276517.jpeg?auto=compress&cs=tinysrgb&w=600',
      timerText: '45 min',
      timerIcon: Icons.timer,
      calorieIcon: Icons.local_fire_department,
      calorieText: '500 cal',
    ),
  ];
}

// ===================================================================
class Datas {
  static var notificationData = {
    'data': {
      'new': {
        'categoryName': 'New',
        'datas': [
          {
            'name': 'FitBody App',
            'image': AppAssets.logo,
            'description': '🔥 New HIIT workout is now available in your plan!',
            'icon': 'assets/icons/dumbbell.png',
            'time': 'Just now',
          },
          {
            'name': 'FitBody App',
            'image': AppAssets.logo,
            'description': '💧 Don’t forget to log your water intake today.',
            'icon': 'assets/icons/water.png',
            'time': '10m',
          },
        ],
      },
      'today': {
        'categoryName': 'Today',
        'datas': [
          {
            'name': 'Coach Dara',
            'image': AppAssets.logo,
            'description': '✅ Great job finishing your Chest & Arms session!',
            'icon': 'assets/icons/check.png',
            'time': '2h',
          },
          {
            'name': 'FitBody App',
            'image': AppAssets.logo,
            'description': '🍎 New healthy recipes added to your meal plan.',
            'icon': 'assets/icons/meal.png',
            'time': '4h',
          },
          {
            'name': 'FitBody App',
            'image': AppAssets.logo,
            'description': '🧘 Time for your daily stretch reminder.',
            'icon': 'assets/icons/stretch.png',
            'time': '6h',
          },
        ],
      },
      'earlier': {
        'categoryName': 'Earlier',
        'datas': [
          {
            'name': 'Coach Sithy',
            'image': AppAssets.logo,
            'description': '👏 You beat your last running record — keep it up!',
            'icon': 'assets/icons/run.png',
            'time': 'Yesterday',
          },
          {
            'name': 'FitBody App',
            'image': AppAssets.logo,
            'description':
                '⭐ Your 7-day streak is complete! Amazing consistency.',
            'icon': 'assets/icons/star.png',
            'time': '2 days ago',
          },
          {
            'name': 'FitBody App',
            'image': AppAssets.logo,
            'description':
                '📲 App update v2.1: New progress charts & dark mode.',
            'icon': 'assets/icons/update.png',
            'time': '3 days ago',
          },
          {
            'name': 'Coach Bory',
            'image': AppAssets.logo,
            'description':
                "💪 Don't miss leg day tomorrow. See you at the gym!",
            'icon': 'assets/icons/leg.png',
            'time': '5 days ago',
          },
        ],
      },
    },
  };

  static var systemNotificationData = {
    'data': {
      'new': {
        'categoryName': 'New',
        'datas': [
          {
            'name': 'FitBody System',
            'image': AppAssets.logo,
            'description':
                '⚡ A new version of FitBody is available. Update now to enjoy the latest features.',
            'icon': 'assets/icons/update.png',
            'time': '5m',
          },
          {
            'name': 'FitBody System',
            'image': AppAssets.logo,
            'description': '🔒 Your account was logged in from a new device.',
            'icon': 'assets/icons/security.png',
            'time': '30m',
          },
        ],
      },
      'today': {
        'categoryName': 'Today',
        'datas': [
          {
            'name': 'FitBody System',
            'image': AppAssets.logo,
            'description':
                '☁️ Backup completed successfully. All your progress is safe.',
            'icon': 'assets/icons/cloud.png',
            'time': '3h',
          },
          {
            'name': 'FitBody System',
            'image': AppAssets.logo,
            'description':
                '💳 Your subscription has been renewed successfully.',
            'icon': 'assets/icons/payment.png',
            'time': '6h',
          },
        ],
      },
      'earlier': {
        'categoryName': 'Earlier',
        'datas': [
          {
            'name': 'FitBody System',
            'image': AppAssets.logo,
            'description':
                '⚠️ Password will expire in 3 days. Please update it for security.',
            'icon': 'assets/icons/warning.png',
            'time': 'Yesterday',
          },
          {
            'name': 'FitBody System',
            'image': AppAssets.logo,
            'description':
                '🔧 Scheduled maintenance completed. All systems are running smoothly.',
            'icon': 'assets/icons/server.png',
            'time': '2 days ago',
          },
          {
            'name': 'FitBody System',
            'image': AppAssets.logo,
            'description':
                'ℹ️ New privacy policy is available. Please review the changes.',
            'icon': 'assets/icons/info.png',
            'time': '4 days ago',
          },
          {
            'name': 'FitBody System',
            'image': AppAssets.logo,
            'description':
                '🎁 Limited-time offer: Refer a friend and both get 1 free month!',
            'icon': 'assets/icons/gift.png',
            'time': '1 week ago',
          },
        ],
      },
    },
  };

  static var workoutData = {
    'data': {
      'round1': {
        'roundName': 'Round 1',
        'exercises': [
          {
            'exerciseName': 'Dumbbell Rows',
            'duration': '00:30',
            'repetition': 'Repetition 3x',
            'image': AppAssets.setUpBG,
          },
          {
            'exerciseName': 'Push Ups',
            'duration': '00:45',
            'repetition': 'Repetition 2x',
            'image': AppAssets.setUpBG,
          },
        ],
      },
      'round2': {
        'roundName': 'Round 2',
        'exercises': [
          {
            'exerciseName': 'Squats',
            'duration': '01:00',
            'repetition': 'Repetition 3x',
            'image': AppAssets.setUpBG,
          },
          {
            'exerciseName': 'Lunges',
            'duration': '00:40',
            'repetition': 'Repetition 2x',
            'image': AppAssets.setUpBG,
          },
        ],
      },
      'round3': {
        'roundName': 'Round 3',
        'exercises': [
          {
            'exerciseName': 'Plank',
            'duration': '00:45',
            'repetition': 'Repetition 3x',
            'image': AppAssets.setUpBG,
          },
          {
            'exerciseName': 'Mountain Climbers',
            'duration': '00:30',
            'repetition': 'Repetition 3x',
            'image': AppAssets.setUpBG,
          },
        ],
      },
    },
  };
}
