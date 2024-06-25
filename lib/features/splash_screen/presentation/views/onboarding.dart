import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rehlatyuae/core/routes/app_routes_strings.dart';
import 'package:rehlatyuae/core/services/cache_service.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';
import 'package:rehlatyuae/core/utils/injector.dart';
import 'package:rehlatyuae/features/splash_screen/presentation/views/unboarding.dart';
import 'package:rehlatyuae/generated/locale_keys.g.dart';

import '../../../../core/utils/custom_button.dart';
import '../../../../core/utils/default_text_button.dart';

class OnBoarding extends StatefulWidget {
  // final SharedPreferences sharedPreferences;

  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // void submit (){
  //   widget.sharedPreferences.setBool('isFirstTime', true).then((value) =>
  //       context.pushRoute(LayoutRoute()));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Stack(
            children: [
              PageView.builder(
                itemCount: contents.length,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (_, currentIndex) {
                  return Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                contents[currentIndex].image,
                              ),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 330.h),
                            Text(
                              contents[currentIndex].title,
                              style: Theme.of(context).textTheme.displayLarge,
                            ),
                            SizedBox(height: 20.h),
                            Text(
                              contents[currentIndex].discription,
                              style: Theme.of(context).textTheme.displayLarge,
                            ),
                            SizedBox(height: 100.h),
                            if (currentIndex == 3)
                              CustomActionButton(
                                  text: LocaleKeys.Get_Started.tr(),
                                  borderRadius: BorderRadius.circular(12.r),
                                  backGroundColor: AppColors.textAndBackgroundColorButton,
                                  style: Theme.of(context).textTheme.displayMedium,
                                  width: 400.w,
                                  height: 55.h,
                                  onTap: () {
                                    GoRouter.of(context).go('/homeScreen');
                                    getIt<CacheService>().setData(
                                      key: AppRoutesString.initialLocationRoute,
                                      value: AppRoutesString.homeScreen,
                                    );
                                    // _controller.nextPage(
                                    //   duration: const Duration(milliseconds: 100),
                                    //   curve: Curves.bounceIn,
                                    // );
                                  }),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
          Stack(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 100.h,
                    ),
                    SizedBox(
                      height: 260.h,
                      child: Center(
                        child: Image.asset('assets/images/logo.png'),
                      ),
                    ),
                    SizedBox(height: 200.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        contents.length,
                        (index) => buildDot(index, context),
                      ),
                    ),
                    SizedBox(
                      height: 80.h,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text(LocaleKeys.Already_have_an_account.tr(), style: Theme.of(context).textTheme.displaySmall),
                      DefaultTextButton(
                        onPressed: () {
                          GoRouter.of(context).go('/loginScreen');
                        },
                        text: LocaleKeys.LogIn.tr(),
                      )
                    ]),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  AnimatedContainer buildDot(int index, BuildContext context) {
    return AnimatedContainer(
      margin: EdgeInsets.only(right: 3.h),
      height: 10.h,
      width: currentIndex == index ? 25.w : 10.w,
      duration: const Duration(milliseconds: 400),
      decoration: BoxDecoration(
          color: currentIndex == index ? AppColors.textAndBackgroundColorButton : AppColors.white,
          shape: BoxShape.circle),
    );
  }
}
