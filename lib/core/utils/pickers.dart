import 'package:flutter/material.dart';

class Pickers {
  static Future<String?> choseDate({
    required BuildContext context,
    DateTime? initialDate,
    DateTime? firstDate,
  }) async {
    DateTime? date = await showDatePicker(
      context: context,
      cancelText: 'Cancel',
      confirmText: 'Confirm',
      initialDate: initialDate ?? DateTime.now().add(const Duration(days: 365)),
      firstDate: firstDate ?? DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(days: 365),
      ),
    );

    if (date != null) {
      return formatDate(date);
    }
    return null;
  }

  static String formatDate(DateTime date) {
    if (date.month < 10) {
      if (date.day < 10) {
        return '${date.year}-0${date.month}-0${date.day}';
      }
      return '${date.year}-0${date.month}-${date.day}';
    }
    if (date.day < 10) {
      if (date.month < 10) {
        return '${date.year}-0${date.month}-0${date.day}';
      }
      return '${date.year}-${date.month}-0${date.day}';
    }
    return '${date.year}-${date.month}-${date.day}';
  }
}
