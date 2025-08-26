import 'package:fitbody_app_ui/config/route/app_route.dart';
import 'package:fitbody_app_ui/config/theme/app_theme.dart';
import 'package:fitbody_app_ui/widgets/custom_card_widget.dart';
import 'package:fitbody_app_ui/widgets/custom_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteProfileScreen extends StatelessWidget {
  const FavoriteProfileScreen({super.key});

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
            AnimatedRoundedTabbarFilled(
              tabs: ['All', 'Video', 'Article'],
              tabContents: [
                //tab all
                _buildTabBarAll,
                // tab contact for sample
                _buildTabBarVideos,
                // tab about for sample
                _buildTabBarArticle,
              ],
              activeColor: Colors.amber,
              inactiveColor: Colors.grey[200]!,
            ),
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
        'Favorite',
        style: AppTextStyles.titleMedium.copyWith(
          color: AppColors.primaryPurple,
        ),
      ),
      centerTitle: false,
    );
  }

  get _buildTabBarAll {
    List<Map<String, dynamic>> allTabData = [
      {
        'title': 'upper body',
        'duration': '45 Minutes',
        'calories': '980 Kcal',
        'exerciseCount': '8 exercises',
        'imageUrl':
            'https://images.pexels.com/photos/416778/pexels-photo-416778.jpeg?cs=srgb&dl=pexels-pixabay-416778.jpg&fm=jpg',
        'isFavorite': true,
      },
      {
        'title': 'lower body',
        'duration': '30 Minutes',
        'calories': '600 Kcal',
        'exerciseCount': '5 exercises',
        'imageUrl':
            'https://images.pexels.com/photos/1552242/pexels-photo-1552242.jpeg?cs=srgb&dl=pexels-dominika-roseclay-1552242.jpg&fm=jpg',
        'isFavorite': false,
      },
      {
        'title': 'full body',
        'duration': '60 Minutes',
        'calories': '1200 Kcal',
        'exerciseCount': '10 exercises',
        'imageUrl':
            'https://images.pexels.com/photos/414029/pexels-photo-414029.jpeg?cs=srgb&dl=pexels-scott-webb-414029.jpg&fm=jpg',
        'isFavorite': true,
      },
      {
        'title': 'cardio blast',
        'duration': '20 Minutes',
        'calories': '500 Kcal',
        'exerciseCount': '4 exercises',
        'imageUrl':
            'https://images.pexels.com/photos/1552106/pexels-photo-1552106.jpeg?cs=srgb&dl=pexels-dominika-roseclay-1552106.jpg&fm=jpg',
        'isFavorite': false,
      },
      {
        'title': 'yoga session',
        'duration': '50 Minutes',
        'calories': '300 Kcal',
        'exerciseCount': '7 exercises',
        'imageUrl':
            'https://images.pexels.com/photos/3823039/pexels-photo-3823039.jpeg?cs=srgb&dl=pexels-elly-fairytale-3823039.jpg&fm=jpg',
        'isFavorite': true,
      },
      {
        'title': 'pilates',
        'duration': '40 Minutes',
        'calories': '450 Kcal',
        'exerciseCount': '6 exercises',
        'imageUrl':
            'https://images.pexels.com/photos/432402/pexels-photo-432402.jpeg?cs=srgb&dl=pexels-pixabay-432402.jpg&fm=jpg',
        'isFavorite': false,
      },
      {
        'title': 'HIIT',
        'duration': '15 Minutes',
        'calories': '350 Kcal',
        'exerciseCount': '3 exercises',
        'imageUrl':
            'https://images.pexels.com/photos/1552108/pexels-photo-1552108.jpeg?cs=srgb&dl=pexels-dominika-roseclay-1552108.jpg&fm=jpg',
        'isFavorite': true,
      },
      {
        'title': 'strength training',
        'duration': '70 Minutes',
        'calories': '1100 Kcal',
        'exerciseCount': '12 exercises',
        'imageUrl':
            'https://images.pexels.com/photos/1552244/pexels-photo-1552244.jpeg?cs=srgb&dl=pexels-dominika-roseclay-1552244.jpg&fm=jpg',
        'isFavorite': false,
      },
      {
        'title': 'core workout',
        'duration': '25 Minutes',
        'calories': '400 Kcal',
        'exerciseCount': '5 exercises',
        'imageUrl':
            'https://images.pexels.com/photos/3757372/pexels-photo-3757372.jpeg?cs=srgb&dl=pexels-andrea-piacquadio-3757372.jpg&fm=jpg',
        'isFavorite': true,
      },
      {
        'title': 'stretching routine',
        'duration': '10 Minutes',
        'calories': '100 Kcal',
        'exerciseCount': '2 exercises',
        'imageUrl':
            'https://images.pexels.com/photos/3757951/pexels-photo-3757951.jpeg?cs=srgb&dl=pexels-andrea-piacquadio-3757951.jpg&fm=jpg',
        'isFavorite': false,
      },
      {
        'title': 'dance cardio',
        'duration': '35 Minutes',
        'calories': '750 Kcal',
        'exerciseCount': '6 exercises',
        'imageUrl':
            'https://images.pexels.com/photos/3756889/pexels-photo-3756889.jpeg?cs=srgb&dl=pexels-andrea-piacquadio-3756889.jpg&fm=jpg',
        'isFavorite': true,
      },
    ];

    return Column(
      children: [
        for (var item in allTabData) ...[
          CustomCardWidget(
            title: item['title'],
            duration: item['duration'],
            calories: item['calories'],
            exerciseCount: item['exerciseCount'],
            imageUrl: item['imageUrl'],
            isFavorite: item['isFavorite'],
          ),
          const SizedBox(height: 20),
        ],
      ],
    );
  }

  get _buildTabBarVideos {
    List<Map<String, dynamic>> allTabData = [
      {
        'title': 'upper body',
        'duration': '45 Minutes',
        'calories': '980 Kcal',
        'exerciseCount': '8 exercises',
        'imageUrl':
            'https://images.unsplash.com/photo-1517836357463-d25dfeac3438',
        'isFavorite': true,
      },
      {
        'title': 'lower body',
        'duration': '30 Minutes',
        'calories': '600 Kcal',
        'exerciseCount': '5 exercises',
        'imageUrl':
            'https://images.unsplash.com/photo-1518609878373-06d740f60d8b',
        'isFavorite': false,
      },
      {
        'title': 'full body',
        'duration': '60 Minutes',
        'calories': '1200 Kcal',
        'exerciseCount': '10 exercises',
        'imageUrl':
            'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b',
        'isFavorite': true,
      },
      {
        'title': 'cardio blast',
        'duration': '20 Minutes',
        'calories': '500 Kcal',
        'exerciseCount': '4 exercises',
        'imageUrl':
            'https://images.unsplash.com/photo-1518611012118-696072aa579a',
        'isFavorite': false,
      },
      {
        'title': 'yoga session',
        'duration': '50 Minutes',
        'calories': '300 Kcal',
        'exerciseCount': '7 exercises',
        'imageUrl':
            'https://t3.ftcdn.net/jpg/03/05/59/32/360_F_305593240_tsLw1F5Nk22hVpuVUNjOPdQrE4WF6zyq.jpg',
        'isFavorite': true,
      },
      {
        'title': 'pilates',
        'duration': '40 Minutes',
        'calories': '450 Kcal',
        'exerciseCount': '6 exercises',
        'imageUrl': 'https://images.unsplash.com/photo-1545205597-3d9d02c29597',
        'isFavorite': false,
      },
      {
        'title': 'HIIT',
        'duration': '15 Minutes',
        'calories': '350 Kcal',
        'exerciseCount': '3 exercises',
        'imageUrl':
            'https://images.unsplash.com/photo-1517838277536-f5f99be501cd',
        'isFavorite': true,
      },
      {
        'title': 'strength training',
        'duration': '70 Minutes',
        'calories': '1100 Kcal',
        'exerciseCount': '12 exercises',
        'imageUrl':
            'https://images.unsplash.com/photo-1534438327276-14e5300c3a48',
        'isFavorite': false,
      },
      {
        'title': 'core workout',
        'duration': '25 Minutes',
        'calories': '400 Kcal',
        'exerciseCount': '5 exercises',
        'imageUrl':
            'https://media.istockphoto.com/id/1311232974/photo/fitnesswoman-training-abs-using-small-ball-rain.jpg?s=612x612&w=0&k=20&c=1hwdlq7Tq5ONowqOp2Ea729F6ks4EncilWHFO9fbLlg=',
        'isFavorite': true,
      },
      {
        'title': 'stretching routine',
        'duration': '10 Minutes',
        'calories': '100 Kcal',
        'exerciseCount': '2 exercises',
        'imageUrl':
            'https://images.unsplash.com/photo-1506126279646-a697353d3166',
        'isFavorite': false,
      },
      {
        'title': 'dance cardio',
        'duration': '35 Minutes',
        'calories': '750 Kcal',
        'exerciseCount': '6 exercises',
        'imageUrl':
            'https://images.unsplash.com/photo-1513593771513-7b58b6c4af38',
        'isFavorite': true,
      },
    ];
    return Column(
      children: [
        for (var item in allTabData) ...[
          CustomCardWidget(
            title: item['title'],
            duration: item['duration'],
            calories: item['calories'],
            exerciseCount: item['exerciseCount'],
            imageUrl: item['imageUrl'],
            isFavorite: item['isFavorite'],
          ),
          const SizedBox(height: 20),
        ],
      ],
    );
  }

  get _buildTabBarArticle {
    List<Map<String, dynamic>> allTabData = [
      {
        'title': 'upper body',
        'duration': '45 Minutes',
        'calories': '980 Kcal',
        'exerciseCount': '8 exercises',
        'imageUrl':
            'https://t4.ftcdn.net/jpg/01/74/21/25/240_F_174212531_cerVf4uP6vinBWieBB46p2P5xVhnsNSK.jpg',
        'isFavorite': true,
      },
      {
        'title': 'lower body',
        'duration': '30 Minutes',
        'calories': '600 Kcal',
        'exerciseCount': '5 exercises',
        'imageUrl':
            'https://images.unsplash.com/photo-1579758629938-03607ccdbaba',
        'isFavorite': false,
      },
      {
        'title': 'full body',
        'duration': '60 Minutes',
        'calories': '1200 Kcal',
        'exerciseCount': '10 exercises',
        'imageUrl':
            'https://images.unsplash.com/photo-1605296867304-46d5465a13f1',
        'isFavorite': true,
      },
      {
        'title': 'cardio blast',
        'duration': '20 Minutes',
        'calories': '500 Kcal',
        'exerciseCount': '4 exercises',
        'imageUrl': 'https://images.unsplash.com/photo-1558611848-73f7eb4001a1',
        'isFavorite': false,
      },
      {
        'title': 'yoga session',
        'duration': '50 Minutes',
        'calories': '300 Kcal',
        'exerciseCount': '7 exercises',
        'imageUrl':
            'https://t3.ftcdn.net/jpg/01/48/87/16/240_F_148871674_wRvPIuNEwxUI1jHadVrb5uoV7C2Sv27i.jpg',
        'isFavorite': true,
      },
      {
        'title': 'pilates',
        'duration': '40 Minutes',
        'calories': '450 Kcal',
        'exerciseCount': '6 exercises',
        'imageUrl':
            'https://t3.ftcdn.net/jpg/01/68/31/12/240_F_168311257_XvQgbZheKyrdEXm7YalNPtFVtAZbcSdz.jpg',
        'isFavorite': false,
      },
      {
        'title': 'HIIT',
        'duration': '15 Minutes',
        'calories': '350 Kcal',
        'exerciseCount': '3 exercises',
        'imageUrl':
            'https://t3.ftcdn.net/jpg/03/20/45/94/240_F_320459487_SAvrvfR4NN4CkFQccj49rBfmiLoYebuw.jpg',
        'isFavorite': true,
      },
      {
        'title': 'strength training',
        'duration': '70 Minutes',
        'calories': '1100 Kcal',
        'exerciseCount': '12 exercises',
        'imageUrl':
            'https://images.unsplash.com/photo-1579758629938-03607ccdbaba',
        'isFavorite': false,
      },
      {
        'title': 'core workout',
        'duration': '25 Minutes',
        'calories': '400 Kcal',
        'exerciseCount': '5 exercises',
        'imageUrl':
            'https://t3.ftcdn.net/jpg/02/14/59/60/240_F_214596042_QB9lDRVMmAr1mn9eFZFgjL9JONicmjn3.jpg',
        'isFavorite': true,
      },
      {
        'title': 'stretching routine',
        'duration': '10 Minutes',
        'calories': '100 Kcal',
        'exerciseCount': '2 exercises',
        'imageUrl':
            'https://t4.ftcdn.net/jpg/01/19/02/41/240_F_119024139_myvWSH6zo9kwTk91Sn674RA7CfkxI3Ru.jpg',
        'isFavorite': false,
      },
      {
        'title': 'dance cardio',
        'duration': '35 Minutes',
        'calories': '750 Kcal',
        'exerciseCount': '6 exercises',
        'imageUrl':
            'https://t4.ftcdn.net/jpg/04/81/05/21/240_F_481052121_0yjD6RwCvTwe8HJcNNdSaurC1LUix3Un.jpg',
        'isFavorite': true,
      },
    ];
    return Column(
      children: [
        for (var item in allTabData) ...[
          CustomCardWidget(
            title: item['title'],
            duration: item['duration'],
            calories: item['calories'],
            exerciseCount: item['exerciseCount'],
            imageUrl: item['imageUrl'],
            isFavorite: item['isFavorite'],
          ),
          SizedBox(height: 20),
        ],
      ],
    );
  }
}
