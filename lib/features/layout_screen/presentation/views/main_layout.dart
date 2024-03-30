import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';
import 'package:rehlatyuae/core/utils/custom_circle_avatar.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/custom_drawer.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/home_screen.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/widgets/custom_app_bar_title.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:rehlatyuae/features/profile/presentation/views/profile_screen.dart';
import 'package:rehlatyuae/features/search/presentation/views/search_screen.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int currentTab = 0;
  List<Widget> tabs = [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currentTab],
      appBar: currentTab == 4
          ? null
          : AppBar(
              surfaceTintColor: AppColors.whiteAppColor,
              title: const CustomAppBarTitle(),
              actions: [
                InkWell(
                  onTap: () {},
                  child: CustomCircleAvatar(
                    radius: 40.0.r,
                    backgroundImage: const AssetImage(
                      "assets/images/Ellipse 1.png",
                    ),
                  ),
                ),
              ],
            ),
      drawer: const CustomDrawer(),
      bottomNavigationBar: CustomBottomNavigationBar(
        onTap: (index) {
          setState(() {
            currentTab = index;
          });
        },
      ),
    );
  }
}
