import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';
import 'package:rehlatyuae/core/utils/app_strings.dart';
import 'package:rehlatyuae/core/utils/custom_button.dart';
import 'package:rehlatyuae/core/utils/custom_dialog.dart';
import 'package:rehlatyuae/core/utils/default_text_button.dart';
import 'package:rehlatyuae/core/utils/injector.dart';
import 'package:rehlatyuae/features/auth/presentation/cubit/verification_email_cubit/verification_email_cubit.dart';
import 'package:rehlatyuae/features/auth/presentation/views/widgets/custom_otp_text_field.dart';

class VerificationScreen extends StatelessWidget {
  final String email;

  const VerificationScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider<VerificationEmailCubit>(
        create: (context) => getIt<VerificationEmailCubit>(),
        child: BlocConsumer<VerificationEmailCubit, VerificationEmailState>(
          listener: (context, state) {
            state.whenOrNull(
              success: (token) {
                context.push(AppStrings.updatePasswordScreen, extra: token);
              },
              error: (message) {
                showDialog(
                  context: context,
                  builder: (context) => CustomDialog(
                    title: message,
                    subtitle: 'Sorry',
                    labelText: 'Close',
                    color: AppColors.redAppColor,
                  ),
                );
              },
            );
          },
          builder: (context, state) {
            var cubit = context.read<VerificationEmailCubit>();
            return state.maybeWhen(
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              orElse: () => ListView(
                padding: EdgeInsets.symmetric(horizontal: 20.w).copyWith(
                  top: 30.h,
                ),
                children: [
                  Text(
                    AppStrings.verification,
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          color: AppColors.black,
                          fontSize: 28.sp,
                        ),
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  Text(
                    AppStrings.checkYourEmail,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: AppColors.greySearchText,
                        ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  CustomOTPTextField(
                    onCompleted: (code) {
                      cubit.code = code;
                    },
                  ),
                  SizedBox(
                    height: 80.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DefaultTextButton(
                        onPressed: () {},
                        text: AppStrings.didYouReceive,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  CustomActionButton(
                    text: AppStrings.verify,
                    borderRadius: BorderRadius.circular(16.sp),
                    backGroundColor: AppColors.textAndBackgroundColorButton,
                    onTap: () async {
                      await cubit.verificationEmail(email: email);
                    },
                    width: double.infinity,
                    height: 50.h,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
