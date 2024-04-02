import 'package:flutter/material.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';
import 'package:rehlatyuae/core/utils/default_text_button.dart';
import 'package:rehlatyuae/generated/locale_keys.g.dart';

class CustomRowTitle extends StatelessWidget {
  const CustomRowTitle({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: const TextStyle(
            color: AppColors.black,
          ),
        ),
        const Spacer(),
        DefaultTextButton(
          text: LocaleKeys.View_all,
          onPressed: onPressed,
        ),
      ],
    );
  }
}
