import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/core/utils/app_assets.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';
import 'package:rehlatyuae/core/utils/cusotm_bottom_sheet.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/widgets/drawer_item.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/widgets/my_booking_content_sheet.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/widgets/send_message_content_sheet.dart';
import 'package:rehlatyuae/generated/locale_keys.g.dart';

class HelpDrawerSection extends StatelessWidget {
  const HelpDrawerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10.w,
            vertical: 10.h,
          ),
          child: Row(
            children: [
              Text(
                LocaleKeys.Help,
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: AppColors.black,
                    ),
              ),
            ],
          ),
        ),
        DrawerItem(
          title: LocaleKeys.My_booking,
          iconPath: AppAssets.myBooking,
          trailing: const [
            Icon(
              Icons.arrow_forward_ios_sharp,
            ),
          ],
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
              builder: (context) => const CustomBottomSheet(
                title: LocaleKeys.My_booking,
                avatarText: 'MY',
                contentSheet: MyBookingContentSheet(),
              ),
            );
          },
        ),
        DrawerItem(
          title: LocaleKeys.Send_message,
          iconPath: AppAssets.sendMessage,
          trailing: const [
            Icon(
              Icons.arrow_forward_ios_sharp,
            ),
          ],
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
              builder: (context) => const CustomBottomSheet(
                title: LocaleKeys.Send_message,
                avatarText: 'ME',
                hasButton: false,
                contentSheet: SendMessageContentSheet(),
              ),
            );
          },
        ),
      ],
    );
  }
}
