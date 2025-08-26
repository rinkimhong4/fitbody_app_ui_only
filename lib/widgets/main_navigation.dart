import 'package:fitbody_app_ui/config/theme/app_theme.dart';
import 'package:fitbody_app_ui/modules/home/views/favorite_screen.dart';
import 'package:fitbody_app_ui/modules/home/views/home_screen.dart';
import 'package:fitbody_app_ui/modules/home/views/resources_screen.dart';
import 'package:fitbody_app_ui/modules/home/views/support_help_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = [
    HomeScreen(),
    ResourcesScreen(),
    FavoriteScreen(),
    SupportHelpScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark,
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Color(0xFF08100c),
          borderRadius: BorderRadius.circular(75),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withValues(alpha: 0.03),
            ),
          ],
        ),
        margin: const EdgeInsets.all(18),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        child: GNav(
          gap: 8,
          activeColor: Colors.white,
          iconSize: 28,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          duration: const Duration(milliseconds: 100),
          tabBackgroundColor: Colors.deepPurple,
          color: Colors.white.withValues(alpha: 0.5),
          tabs: const [
            GButton(icon: Icons.home_filled, text: 'Home'),
            GButton(icon: Icons.book, text: 'Resources'),
            GButton(icon: Icons.favorite_border, text: 'Favorites'),
            GButton(icon: Icons.support_agent, text: 'Support'),
          ],
          selectedIndex: _selectedIndex,
          onTabChange: (index) => setState(() => _selectedIndex = index),
        ),
      ),
    );
  }
}
