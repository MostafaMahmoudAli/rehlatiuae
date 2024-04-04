import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
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
import 'package:rehlatyuae/features/auth/presentation/cubit/register_cubit/register_cubit.dart';
import 'package:rehlatyuae/generated/locale_keys.g.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterCubit>(
      create: (context) => getIt<RegisterCubit>(),
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppAssets.registerBackground),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            BlocConsumer<RegisterCubit, RegisterState>(
              listener: (context, state) {
                state.whenOrNull(
                  success: (authenticatedClient) {
                    context.push(AppRoutesString.homeScreen);
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
                var cubit = context.read<RegisterCubit>();
                return state.maybeWhen(
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  orElse: () => SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Form(
                      key: cubit.registerFormKey,
                      child: Column(
                        children: [
                          SizedBox(height: 75.h),
                          Image.asset('assets/images/logo.png'),
                          SizedBox(height: 30.h),
                          Row(
                            children: [
                              Text(
                                LocaleKeys.Register_now.tr(),
                                style: Theme.of(context).textTheme.headlineLarge,
                              ),
                            ],
                          ),
                          SizedBox(height: 30.h),
                          PrimaryTextField(
                            controller: cubit.nameEditingController,
                            validator: (value) => AppValidator.validateName(value),
                            hint: LocaleKeys.your_name.tr(),
                            padding: EdgeInsets.only(bottom: 20.h),
                            textColor: AppColors.white,
                            suffix: const Icon(
                              CupertinoIcons.person,
                              color: AppColors.textAndBackgroundColorButton,
                            ),
                          ),
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
                          SizedBox(height: 30.h),
                          CustomActionButton(
                            onTap: () async {
                              await cubit.register();
                            },
                            text: LocaleKeys.Sign_Up.tr(),
                            borderRadius: BorderRadius.circular(12.r),
                            backGroundColor: AppColors.textAndBackgroundColorButton,
                            height: 60.h,
                            width: double.infinity,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                LocaleKeys.If_you_have_an_account.tr(),
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                              DefaultTextButton(
                                onPressed: () {
                                  context.pop();
                                },
                                text: LocaleKeys.Sign_In_here.tr(),
                              ),
                            ],
                          ),
                          Text(
                           LocaleKeys.By_clicking_Sing_up.tr(),
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              DefaultTextButton(
                                onPressed: () {
                                  context.push('/termsConditionsScreen');
                                },
                                text: LocaleKeys.Terms.tr(),
                              ),
                              Text(
                                LocaleKeys.and.tr(),
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                              DefaultTextButton(
                                onPressed: () {
                                  context.push('/privacyPolicyScreen');
                                },
                                text: LocaleKeys.Privacy_Policy.tr(),
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
