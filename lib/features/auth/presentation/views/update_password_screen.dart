import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';
import 'package:rehlatyuae/core/utils/app_strings.dart';
import 'package:rehlatyuae/core/utils/custom_button.dart';
import 'package:rehlatyuae/core/utils/custom_dialog.dart';
import 'package:rehlatyuae/core/utils/injector.dart';
import 'package:rehlatyuae/core/utils/primary_text_field.dart';
import 'package:rehlatyuae/features/auth/presentation/cubit/update_password_cubit/update_password_cubit.dart';

class UpdatePasswordScreen extends StatelessWidget {
  final String token;

  const UpdatePasswordScreen({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider<UpdatePasswordCubit>(
        create: (context) => getIt<UpdatePasswordCubit>(),
        child: BlocConsumer<UpdatePasswordCubit, UpdatePasswordState>(
          listener: (context, state) {
            state.whenOrNull(
              success: (client, token) {
                context.push(AppStrings.homeScreen);
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
            var cubit = context.read<UpdatePasswordCubit>();
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
                          AppStrings.updatePassword,
                          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                                color: AppColors.black,
                                fontSize: 28.sp,
                              ),
                        ),
                        SizedBox(
                          height: 7.h,
                        ),
                        Text(
                          AppStrings.youCanNowUpdate,
                          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                color: AppColors.greySearchText,
                              ),
                        ),
                      ],
                    ),
                  ),
                  Form(
                    key: cubit.updatePasswordFormKey,
                    child: Column(
                      children: [
                        PrimaryTextField(
                          controller: cubit.passwordEditingController,
                          hint: AppStrings.newPassword,
                          isObscureText: true,
                        ),
                        PrimaryTextField(
                          controller: cubit.passwordConfirmationEditingController,
                          isObscureText: true,
                          hint: AppStrings.renterPassword,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w).copyWith(
                      top: 30.h,
                    ),
                    child: CustomActionButton(
                      text: AppStrings.updatePassword,
                      borderRadius: BorderRadius.circular(16.sp),
                      backGroundColor: AppColors.textAndBackgroundColorButton,
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => CustomDialog(
                            title: "Change Password Success",
                            subtitle: 'Success',
                            labelText: "Back to Homepage",
                            color: AppColors.green,
                            onTap: () async {
                              await cubit.updatePassword(token: token);
                            },
                          ),
                        );
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
