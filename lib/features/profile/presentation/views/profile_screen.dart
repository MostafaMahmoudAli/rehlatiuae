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
import 'package:rehlatyuae/features/profile/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'package:rehlatyuae/features/profile/presentation/views/widgets/profile_card_details.dart';
import 'package:rehlatyuae/features/profile/presentation/views/widgets/profile_photo_section.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileCubit>(
      create: (context) => getIt<ProfileCubit>()..getProfile(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppStrings.profile,
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  color: AppColors.black,
                ),
          ),
          actions: [
            BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                return state.maybeWhen(
                  loaded: (client) => DefaultTextButton(
                    onPressed: () async {
                      bool isProfileEdited = await context.push(AppStrings.editProfileScreen, extra: client) as bool;
                      if (isProfileEdited && context.mounted) {
                        context.read<ProfileCubit>().getProfile();
                      }
                    },
                    text: AppStrings.edit,
                  ),
                  orElse: () => const SizedBox(),
                );
              },
            ),
          ],
        ),
        body: BlocConsumer<ProfileCubit, ProfileState>(
          listener: (context, state) {
            state.whenOrNull(
              error: (message) {
                showDialog(
                  context: context,
                  builder: (context) => CustomDialog(
                    title: message,
                    subtitle: 'Sorry',
                    labelText: 'Close',
                  ),
                );
              },
            );
          },
          builder: (context, state) {
            return state.maybeWhen(
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              loaded: (client) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w).copyWith(bottom: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ProfilePhotoSection(client: client),
                    SizedBox(
                      height: 20.h,
                    ),
                    ProfileCardDetails(
                      title: AppStrings.phone,
                      value: client.phone,
                    ),
                    ProfileCardDetails(
                      title: 'Address',
                      value: client.address,
                    ),
                    CustomActionButton(
                      text: 'Delete Account',
                      borderRadius: BorderRadius.circular(16.r),
                      backGroundColor: AppColors.redAppColor,
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (c) => CustomDialog(
                            title: "Are you sure to delete the account?",
                            subtitle: "Are you sure",
                            labelText: "Yes !",
                            color: AppColors.redAppColor,
                            onTap: () async {
                              await context.read<ProfileCubit>().deleteAccount();
                            },
                          ),
                        );
                      },
                      width: double.infinity,
                      height: 50.h,
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(top: 10.h),
                      child: DefaultTextButton(
                        onPressed: () {
                          context.push(AppStrings.forgetPasswordScreen);
                        },
                        text: "Forget Password",
                      ),
                    ),
                  ],
                ),
              ),
              deleteSuccess: () => Center(
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: 10.h),
                  child: DefaultTextButton(
                    onPressed: () {
                      context.push(AppStrings.registerScreen);
                    },
                    text: "Register",
                  ),
                ),
              ),
              orElse: () => const SizedBox(),
            );
          },
        ),
      ),
    );
  }
}
