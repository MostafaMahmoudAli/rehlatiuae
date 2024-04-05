import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/core/utils/cusotm_bottom_sheet.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/widgets/my_booking_content_sheet.dart';
import 'package:rehlatyuae/generated/locale_keys.g.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 30.h),
      child: CustomBottomSheet(
        title: LocaleKeys.My_booking.tr(),
        avatarText: 'MY',
        hasAppbar: false,
        contentSheet: const MyBookingContentSheet(),
      ),
    );
  }
}
