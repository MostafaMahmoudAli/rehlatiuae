import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';

class PrimaryTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? label;
  final String? hint;
  final bool isObscureText;
  final bool autofocus;
  final bool readOnly;
  final bool isEnabled;
  final bool isTextAria;
  final TextInputType inputType;
  final TextInputAction textInputAction;
  final FormFieldValidator? validator;
  final Widget? suffix;
  final EdgeInsets? padding;
  final FocusNode? focusNode;
  final Color textColor;
  final void Function()? onTap;

  const PrimaryTextField({
    super.key,
    required this.controller,
    this.label,
    this.hint,
    this.isObscureText = false,
    this.inputType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.autofocus = false,
    this.validator,
    this.readOnly = false,
    this.isEnabled = true,
    this.isTextAria = false,
    this.textColor = AppColors.black,
    this.suffix,
    this.padding,
    this.focusNode,
    this.onTap,
  });

  @override
  State<PrimaryTextField> createState() => _PrimaryTextFieldState();
}

class _PrimaryTextFieldState extends State<PrimaryTextField> {
  bool isVisibleText = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? EdgeInsets.symmetric(horizontal: 21.w, vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.label != null)
            Text(
              widget.label!,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          if (widget.label != null)
            SizedBox(
              height: 8.h,
            ),
          TextFormField(
            controller: widget.controller,
            validator: widget.validator,
            focusNode: widget.focusNode,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            textInputAction: widget.textInputAction,
            keyboardType: widget.inputType,
            obscureText: widget.isObscureText && !isVisibleText,
            onChanged: (value) {
              setState(() {});
            },
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: widget.textColor,
                  letterSpacing: 1.5,
                ),
            textDirection: widget.inputType == TextInputType.phone
                ? TextDirection.ltr
                : widget.controller.text.isNotEmpty && widget.controller.text.trim().isNotEmpty
                    ? RegExp(r'^[a-zA-Z0-9٠-٩]').hasMatch(widget.controller.text)
                        ? TextDirection.ltr
                        : TextDirection.rtl
                    : null,
            maxLines: widget.isTextAria ? 3 : 1,
            decoration: InputDecoration(
              hintText: widget.hint,
              hintStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: widget.textColor,
                  ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 15.w,
                vertical: 10.h,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: const BorderSide(
                  color: AppColors.textAndBackgroundColorButton,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: const BorderSide(
                  color: AppColors.textAndBackgroundColorButton,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: const BorderSide(
                  color: AppColors.textAndBackgroundColorButton,
                ),
              ),
              suffixIcon: widget.isObscureText
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          isVisibleText = !isVisibleText;
                        });
                      },
                      icon: isVisibleText
                          ? const Icon(
                              CupertinoIcons.lock_open,
                              color: AppColors.textAndBackgroundColorButton,
                            )
                          : const Icon(
                              CupertinoIcons.lock,
                              color: AppColors.textAndBackgroundColorButton,
                            ),
                    )
                  : widget.suffix,
              errorStyle: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: AppColors.redAppColor,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w800,
                  ),
              errorMaxLines: 2,
            ),
            readOnly: widget.readOnly,
            onTap: widget.onTap,
            onTapOutside: (event) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            enabled: widget.isEnabled,
          ),
        ],
      ),
    );
  }
}
