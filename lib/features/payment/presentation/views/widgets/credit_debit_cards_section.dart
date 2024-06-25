import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/core/utils/app_assets.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';
import 'package:rehlatyuae/core/utils/custom_icon_button.dart';
import 'package:rehlatyuae/features/payment/presentation/views/add_card_bottom_sheet.dart';
import 'package:rehlatyuae/features/payment/presentation/views/widgets/cusotm_radio_tile.dart';
import 'package:rehlatyuae/generated/locale_keys.g.dart';

class CreditDebitCardsSection extends StatefulWidget {
  final String total;
  final String childrenCount;
  final String adultCount;
  final String address;

  const CreditDebitCardsSection({
    required this.total,
    required this.childrenCount,
    required this.adultCount,
    required this.address,
    super.key,
  });

  @override
  State<CreditDebitCardsSection> createState() => _CreditDebitCardsSectionState();
}

class _CreditDebitCardsSectionState extends State<CreditDebitCardsSection> {
  String selectedCard = '';
  int adultNumber = 1, childCount = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Container(
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16.sp),
          border: Border.all(
            width: 1.h,
            color: AppColors.black.withOpacity(0.3),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
               LocaleKeys.Credit_Cards,
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: AppColors.black,
                  ),
            ),
            SizedBox(
              height: 15.h,
            ),
            CustomRadioTile(
              name: 'Axis Bank',
              number: '**** **** **** 8395',
              imagePath: AppAssets.logoMastercard,
              value: 'master',
              selectedValue: selectedCard,
              onChanged: (value) {
                setState(() {
                  selectedCard = value!;
                });
              },
            ),
            const SizedBox(
              height: 10,
            ),
            CustomRadioTile(
              name: 'HDFC Bank',
              number: '**** **** **** 6246',
              imagePath: AppAssets.logoVisa,
              value: 'visa',
              selectedValue: selectedCard,
              onChanged: (value) {
                setState(() {
                  selectedCard = value!;
                });
              },
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                    builder: (context) => const AddCardBottomSheet(),
                  );
                },
                child: Row(
                  children: [
                    CustomIconButton(
                      icon: Icons.add,
                      iconColor: AppColors.textAndBackgroundColorButton,
                      backgroundColor: AppColors.textAndBackgroundColorButton.withOpacity(0.2),
                      size: 40,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      LocaleKeys.Add_New_Card,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
