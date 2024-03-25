import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';

class CustomOTPTextField extends StatefulWidget {
  final void Function(String)? onCompleted;

  const CustomOTPTextField({this.onCompleted, super.key});

  @override
  State<CustomOTPTextField> createState() => _CustomOTPTextFieldState();
}

class _CustomOTPTextFieldState extends State<CustomOTPTextField> {
  final FocusNode focusNode = FocusNode();
  final OtpFieldController otpFieldController = OtpFieldController();
  String otp = '';
  bool otpHasError = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: RawKeyboardListener(
          focusNode: focusNode,
          onKey: (value) {
            // if (otp.isNotEmpty && value.data.logicalKey.keyLabel == "Backspace") {
            //   List.generate(
            //     6,
            //     (index) => otpFieldController.setValue('', index),
            //   );
            //   otpFieldController.setFocus(0);
            // }
          },
          child: OTPTextField(
            controller: otpFieldController,
            hasError: otpHasError,
            length: 6,
            textFieldAlignment: MainAxisAlignment.spaceBetween,
            outlineBorderRadius: 0.r,
            fieldWidth: 35.w,
            style: TextStyle(fontSize: 17.sp),
            otpFieldStyle: OtpFieldStyle(
              borderColor: AppColors.black,
              disabledBorderColor: AppColors.black,
              enabledBorderColor: AppColors.black,
              errorBorderColor: AppColors.black,
              focusBorderColor: AppColors.textAndBackgroundColorButton,
            ),
            onChanged: (pin) {
              setState(() {
                otpHasError = false;
                otp = pin;
              });
            },
            onCompleted: widget.onCompleted,
          ),
        ),
      ),
    );
  }
}
