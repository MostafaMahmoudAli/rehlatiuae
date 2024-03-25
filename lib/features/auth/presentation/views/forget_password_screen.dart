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
import 'package:rehlatyuae/core/utils/primary_text_field.dart';
import 'package:rehlatyuae/features/auth/presentation/cubit/forget_password_cubit/forget_password_cubit.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider<ForgetPasswordCubit>(
        create: (context) => getIt<ForgetPasswordCubit>(),
        child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
          listener: (context, state) {
            state.whenOrNull(
              success: () {
                context.push(
                  AppStrings.verificationScreen,
                  extra: context.read<ForgetPasswordCubit>().emailEditingController.text,
                );
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
            final cubit = context.read<ForgetPasswordCubit>();
            return state.maybeWhen(
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              orElse: () => ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 30.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.forgotPassword,
                          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                                color: AppColors.black,
                                fontSize: 28.sp,
                              ),
                        ),
                        SizedBox(
                          height: 7.h,
                        ),
                        Text(
                          AppStrings.enterYourInformation,
                          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                color: AppColors.greySearchText,
                              ),
                        ),
                      ],
                    ),
                  ),
                  Form(
                    key: cubit.forgetPasswordFormKey,
                    child: PrimaryTextField(
                      controller: cubit.emailEditingController,
                      hint: AppStrings.email,
                      inputType: TextInputType.emailAddress,
                    ),
                  ),
                  SizedBox(
                    height: 80.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DefaultTextButton(
                        onPressed: () {},
                        text: AppStrings.tryAnotherWay,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w).copyWith(
                      top: 30.h,
                    ),
                    child: CustomActionButton(
                      text: AppStrings.send,
                      borderRadius: BorderRadius.circular(16.r),
                      backGroundColor: AppColors.textAndBackgroundColorButton,
                      onTap: () async {
                        await cubit.forgetPassword();
                      },
                      width: double.infinity,
                      height: 50.h,
                    ),
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
