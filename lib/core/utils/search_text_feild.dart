import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';
import 'package:rehlatyuae/core/utils/app_strings.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    required this.controller, this.onTap, this.onChanged, this.readOnly, this.onSubmitted,
  });
  final TextEditingController? controller;
final void Function()? onTap;
final void Function(String)? onChanged;
final void Function(String)? onSubmitted;
final bool?readOnly;
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
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: AppStrings.searchTextFieldHintText,
          hintStyle: TextStyle(color: AppColors.greySearchText),
          prefixIcon: Icon(
            Icons.search,
            color: AppColors.greySearchText,
          ),
        ),
        onTap: onTap,
        onChanged: onChanged,
        readOnly: readOnly ?? false,
        onSubmitted:onSubmitted,
      ),
    );
  }
}
