import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rehlatyuae/core/utils/app_assets.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/widgets/account_drawer_section.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/widgets/help_drawer_section.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/widgets/legal_drawer_section.dart';

class CustomDrawer extends StatelessWidget
{
  const CustomDrawer({super.key});
  @override
  Widget build(BuildContext context)
  {
    return Drawer(
      width: 270.w,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 30.h),
        child: Column(
          children: [
            SvgPicture.asset(AppAssets.blueLogo),
            const AccountDrawerSection(),
            const HelpDrawerSection(),
            const LegalDrawerSection(),
            Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: Text(
                "Version 2.2.22",
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
