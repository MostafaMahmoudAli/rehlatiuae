import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';
import 'package:rehlatyuae/core/utils/custom_circle_avatar.dart';
import 'package:rehlatyuae/core/utils/custom_dialog.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/cubits/main_cubit/main_cubit.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/custom_drawer.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/home_screen.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/widgets/custom_app_bar_title.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:rehlatyuae/features/profile/presentation/views/profile_screen.dart';

import '../../../search/presentation/views/search_screen.dart';


class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout>
{
  int currentTab = 0;
  List<Widget> tabs = [
    HomeScreen(),
    SearchScreen(),
    HomeScreen(),
    HomeScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<MainCubit, MainState>(
        listener: (context, state) {
          state.whenOrNull(
            error: (message) {
              showDialog(
                context: context,
                builder: (context) => CustomDialog(
                  title: message,
                  subtitle: 'Sorry',
                  labelText: 'Close',
                ),
              );
            },
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => Padding(
              padding: EdgeInsets.symmetric(
                vertical: 300.h,
              ),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
            orElse: () => tabs[currentTab],
          );
        },
      ),
      appBar: currentTab == 4
          ? null
          : AppBar(
              surfaceTintColor: AppColors.whiteAppColor,
              title: const CustomAppBarTitle(),
              actions: [
                InkWell(
                  onTap: () {
                    setState(() {
                      currentTab = 4;
                    });
                  },
                  child: BlocBuilder<MainCubit, MainState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        success: () {
                          return context.read<MainCubit>().client != null
                              ? CustomCircleAvatar(
                                  radius: 25.0.r,
                                  backgroundColor: AppColors.whiteAppColor,
                                  backgroundImage: CachedNetworkImageProvider(
                                    context.read<MainCubit>().client!.imagePath,
                                  ),
                                )
                              : CustomCircleAvatar(
                                  radius: 25.0.r,
                                  backgroundImage: const AssetImage(
                                    "assets/images/Ellipse 1.png",
                                  ),
                                );
                        },
                        orElse: () => CustomCircleAvatar(
                          radius: 25.0.r,
                          backgroundColor: AppColors.whiteAppColor,
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  width: 8.w,
                )
              ],
            ),
      drawer: const CustomDrawer(),
      bottomNavigationBar: CustomBottomNavigationBar(
        onTap: (index) {
          setState(() {
            currentTab = index;
          });
        },
        index: currentTab,
      ),
    );
  }
}
