import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rehlatyuae/core/routes/app_routes_strings.dart';
import 'package:rehlatyuae/core/utils/app_assets.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';
import 'package:rehlatyuae/core/utils/custom_button.dart';
import 'package:rehlatyuae/core/utils/custom_dialog.dart';
import 'package:rehlatyuae/core/utils/default_text_button.dart';
import 'package:rehlatyuae/core/utils/injector.dart';
import 'package:rehlatyuae/core/utils/primary_text_field.dart';
import 'package:rehlatyuae/core/utils/regex.dart';
import 'package:rehlatyuae/features/auth/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:rehlatyuae/generated/locale_keys.g.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/cubits/main_cubit/main_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => getIt<LoginCubit>(),
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppAssets.loginBackground),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            BlocConsumer<LoginCubit, LoginState>(
              listener: (context, state) {
                state.whenOrNull(
                  success: (authenticatedClient) {
                    context.read<MainCubit>().getCachedClient();
                    context.go(AppRoutesString.homeScreen);
                  },
                  error: (message) {
                    showDialog(
                      context: context,
                      builder: (context) => CustomDialog(
                        title: message,
                        subtitle:  LocaleKeys.Sorry.tr(),
                        labelText:  LocaleKeys.Close.tr(),
                        color: AppColors.redAppColor,
                      ),
                    );
                  },
                );
              },
              builder: (context, state) {
                var cubit = context.read<LoginCubit>();
                return state.maybeWhen(
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  orElse: () => SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Form(
                      key: cubit.loginFormKey,
                      child: Column(
                        children: [
                          SizedBox(height: 75.h),
                          Image.asset('assets/images/logo.png'),
                          SizedBox(height: 30.h),
                          Row(
                            children: [
                              Text(
                                LocaleKeys.LogIn_today.tr(),
                                style: Theme.of(context).textTheme.headlineLarge,
                              ),
                            ],
                          ),
                          SizedBox(height: 30.h),
                          PrimaryTextField(
                            controller: cubit.emailEditingController,
                            validator: (value) => AppValidator.validateEmail(value),
                            hint: 'youremail@mail.com',
                            padding: EdgeInsets.only(bottom: 20.h),
                            textColor: AppColors.white,
                            inputType: TextInputType.emailAddress,
                            suffix: const Icon(
                              Icons.mail_outline_sharp,
                              color: AppColors.textAndBackgroundColorButton,
                            ),
                          ),
                          PrimaryTextField(
                            controller: cubit.passwordEditingController,
                            validator: (value) => AppValidator.validatePassword(value),
                            hint: LocaleKeys.password.tr(),
                            padding: EdgeInsets.zero,
                            textColor: AppColors.white,
                            suffix: const Icon(
                              Icons.mail_outline_sharp,
                              color: AppColors.textAndBackgroundColorButton,
                            ),
                            isObscureText: true,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              DefaultTextButton(
                                onPressed: () {
                                  context.push('/forgetPasswordScreen');
                                },
                                text:  LocaleKeys.Forgot_Password.tr(),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.h),
                          CustomActionButton(
                            onTap: () async {
                              await cubit.login();
                              // context.go(AppStrings.homeScreen);
                            },
                            text: LocaleKeys.LogIn.tr(),
                            borderRadius: BorderRadius.circular(12.r),
                            backGroundColor: AppColors.textAndBackgroundColorButton,
                            height: 60.h,
                            width: double.infinity,
                          ),
                          SizedBox(height: 30.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                LocaleKeys.Didnt_have_any_account.tr(),
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                              DefaultTextButton(
                                onPressed: () {
                                  context.push('/registerScreen');
                                },
                                text: LocaleKeys.Sign_Up_here.tr(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
