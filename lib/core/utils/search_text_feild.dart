// ignore_for_file: prefer_const_constructors

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';
import 'package:rehlatyuae/generated/locale_keys.g.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    required this.controller,
  });

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0.r),
        border: Border.all(color: AppColors.greySearchText),
      ),
      child: TextField(
        controller: controller,
        decoration:  InputDecoration(
          border: InputBorder.none,
          hintText: LocaleKeys.Search_by_activities.tr(),
          hintStyle: const TextStyle(color: AppColors.greySearchText),
          prefixIcon: Icon(
            Icons.search,
            color: AppColors.greySearchText,
          ),
        ),
      ),
    );
  }
}
