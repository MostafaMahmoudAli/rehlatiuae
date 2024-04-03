import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rehlatyuae/core/utils/app_assets.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';
import 'package:rehlatyuae/core/utils/app_strings.dart';
import 'package:rehlatyuae/core/utils/cusotm_bottom_sheet.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/cubits/main_cubit/main_cubit.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/widgets/drawer_item.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/widgets/my_booking_content_sheet.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/widgets/send_message_content_sheet.dart';

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
                "Help",
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: AppColors.black,
                    ),
              ),
            ],
          ),
        ),
        DrawerItem(
          title: 'My booking',
          iconPath: AppAssets.myBooking,
          trailing: const [
            Icon(
              Icons.arrow_forward_ios_sharp,
            ),
          ],
          onTap: () {
            if (context.read<MainCubit>().client != null) {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
                builder: (context) => const CustomBottomSheet(
                  title: 'My Booking',
                  avatarText: 'MY',
                  contentSheet: MyBookingContentSheet(),
                ),
              );
            } else {
              context.push(AppStrings.loginScreen);
            }
          },
        ),
        DrawerItem(
          title: 'My Favorite',
          iconPath: AppAssets.favorite,
          trailing: const [
            Icon(
              Icons.arrow_forward_ios_sharp,
            ),
          ],
          onTap: () {
            context.push(
              context.read<MainCubit>().client != null ? AppStrings.favouritesScreen : AppStrings.loginScreen,
            );
          },
        ),
        DrawerItem(
          title: 'Send message',
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
                title: 'Send message',
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
