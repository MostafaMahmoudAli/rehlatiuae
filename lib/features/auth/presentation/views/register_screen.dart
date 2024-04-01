import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rehlatyuae/core/utils/app_assets.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';
import 'package:rehlatyuae/core/utils/app_strings.dart';
import 'package:rehlatyuae/core/utils/custom_button.dart';
import 'package:rehlatyuae/core/utils/custom_dialog.dart';
import 'package:rehlatyuae/core/utils/default_text_button.dart';
import 'package:rehlatyuae/core/utils/injector.dart';
import 'package:rehlatyuae/core/utils/primary_text_field.dart';
import 'package:rehlatyuae/core/utils/regex.dart';
import 'package:rehlatyuae/features/auth/presentation/cubit/register_cubit/register_cubit.dart';

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
                                'Register now',
                                style: Theme.of(context).textTheme.headlineLarge,
                              ),
                            ],
                          ),
                          SizedBox(height: 30.h),
                          PrimaryTextField(
                            controller: cubit.nameEditingController,
                            validator: (value) => AppValidator.validateName(value),
                            hint: 'your name',
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
                            hint: 'password',
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
                            text: 'Sign Up',
                            borderRadius: BorderRadius.circular(12.r),
                            backGroundColor: AppColors.textAndBackgroundColorButton,
                            height: 60.h,
                            width: double.infinity,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'If you have an account?',
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                              DefaultTextButton(
                                onPressed: () {
                                  context.pop();
                                },
                                text: ' Sign In here',
                              ),
                            ],
                          ),
                          Text(
                            'By clicking Sing up, you agree to our ',
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
                                text: 'Terms',
                              ),
                              Text(
                                'and',
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                              DefaultTextButton(
                                onPressed: () {
                                  context.push('/privacyPolicyScreen');
                                },
                                text: 'Privacy Policy',
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
