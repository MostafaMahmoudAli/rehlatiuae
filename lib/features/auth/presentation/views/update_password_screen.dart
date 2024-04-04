import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rehlatyuae/core/routes/app_routes_strings.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';
import 'package:rehlatyuae/core/utils/custom_button.dart';
import 'package:rehlatyuae/core/utils/custom_dialog.dart';
import 'package:rehlatyuae/core/utils/injector.dart';
import 'package:rehlatyuae/core/utils/primary_text_field.dart';
import 'package:rehlatyuae/features/auth/presentation/cubit/update_password_cubit/update_password_cubit.dart';
import 'package:rehlatyuae/generated/locale_keys.g.dart';

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
              success: (authenticatedClient) {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => PopScope(
                    canPop: false,
                    child: CustomDialog(
                      title: LocaleKeys.Change_Password_Success.tr(),
                      subtitle: LocaleKeys.Success.tr(),
                      labelText: LocaleKeys.Back_to_Homepage.tr(),
                      color: AppColors.green,
                      onTap: () {
                        context.go(AppRoutesString.homeScreen);
                      },
                    ),
                  ),
                );
              },
              error: (message) {
                showDialog(
                  context: context,
                  builder: (context) => CustomDialog(
                    title: message,
                    subtitle: LocaleKeys.Sorry.tr(),
                    labelText: LocaleKeys.Close.tr(),
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
                         LocaleKeys.Update_Password.tr(),
                          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                                color: AppColors.black,
                                fontSize: 28.sp,
                              ),
                        ),
                        SizedBox(
                          height: 7.h,
                        ),
                        Text(
                          LocaleKeys.You_can_now_update_your_password.tr(),
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
                          hint: LocaleKeys.New_Password.tr(),
                          isObscureText: true,
                        ),
                        PrimaryTextField(
                          controller: cubit.passwordConfirmationEditingController,
                          isObscureText: true,
                          hint: LocaleKeys.enter_Password.tr(),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w).copyWith(
                      top: 30.h,
                    ),
                    child: CustomActionButton(
                      text: LocaleKeys.Update_Password.tr(),
                      borderRadius: BorderRadius.circular(16.sp),
                      backGroundColor: AppColors.textAndBackgroundColorButton,
                      onTap: () async {
                        await cubit.updatePassword(token: token);
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
