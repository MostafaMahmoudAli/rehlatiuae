import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';
import 'package:rehlatyuae/core/utils/custom_button.dart';
import 'package:rehlatyuae/core/utils/primary_text_field.dart';
import 'package:rehlatyuae/generated/locale_keys.g.dart';

class AddCardBottomSheet extends StatelessWidget {
  const AddCardBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
                vertical: 30.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      context.pop(context);
                    },
                    icon: const Icon(Icons.clear),
                  ),
                  Text(
                    LocaleKeys.Add_New_Card,
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          color: AppColors.black,
                        ),
                  ),
                  const IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.clear,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ),
            PrimaryTextField(
              controller: TextEditingController(),
              label: "Card Number",
              hint: "Enter 12 digit card number",
              inputType: TextInputType.number,
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                children: [
                  Expanded(
                    child: PrimaryTextField(
                      controller: TextEditingController(),
                      label: "Valid thru",
                      hint: "MM",
                      padding: EdgeInsets.zero,
                      inputType: TextInputType.number,
                    ),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Expanded(
                    child: PrimaryTextField(
                      controller: TextEditingController(),
                      label: "",
                      hint: "DD",
                      padding: EdgeInsets.zero,
                      inputType: TextInputType.number,
                    ),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Expanded(
                    child: PrimaryTextField(
                      controller: TextEditingController(),
                      label: "cvv",
                      hint: "---",
                      padding: EdgeInsets.zero,
                      inputType: TextInputType.number,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            PrimaryTextField(
              controller: TextEditingController(),
              label: "Card Holder’s Name",
              hint: "Name on Card",
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: CustomActionButton(
            text: 'Save card and Proceed',
            borderRadius: BorderRadius.circular(16.r),
            backGroundColor: AppColors.textAndBackgroundColorButton,
            onTap: () {
              context.pop();
            },
            width: double.infinity,
            height: 50.h,
          ),
        ),
      ],
    );
  }
}
