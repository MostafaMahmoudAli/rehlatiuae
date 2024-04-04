import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rehlatyuae/core/routes/app_routes_strings.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';
import 'package:rehlatyuae/core/utils/custom_button.dart';
import 'package:rehlatyuae/core/utils/custom_dialog.dart';
import 'package:rehlatyuae/core/utils/default_text_button.dart';
import 'package:rehlatyuae/core/utils/injector.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/cubits/main_cubit/main_cubit.dart';
import 'package:rehlatyuae/features/profile/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'package:rehlatyuae/features/profile/presentation/views/widgets/profile_card_details.dart';
import 'package:rehlatyuae/features/profile/presentation/views/widgets/profile_photo_section.dart';
import 'package:rehlatyuae/generated/locale_keys.g.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileCubit>(
      create: (context) => getIt<ProfileCubit>()..getProfile(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            LocaleKeys.Profile.tr(),
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
                      bool isProfileEdited = await context.push(AppRoutesString.editProfileScreen, extra: client) as bool;
                      if (isProfileEdited && context.mounted) {
                        context.read<ProfileCubit>().getProfile();
                      }
                    },
                    text: LocaleKeys.Edit.tr(),
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
                    subtitle: LocaleKeys.Sorry.tr(),
                    labelText: LocaleKeys.Close.tr(),
                  ),
                );
              },
              loaded: (client) {
                context.read<MainCubit>().getCachedClient();
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
                      title: LocaleKeys.Phone.tr(),
                      value: client.phone ?? '',
                    ),
                    ProfileCardDetails(
                      title: LocaleKeys.Address.tr(),
                      value: client.address,
                    ),
                    CustomActionButton(
                      text: LocaleKeys.Delete_Account.tr(),
                      borderRadius: BorderRadius.circular(16.r),
                      backGroundColor: AppColors.redAppColor,
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (c) => CustomDialog(
                            title: LocaleKeys.Are_you_sure_to_delete.tr(),
                            subtitle: LocaleKeys.Are_you_sure.tr(),
                            labelText: LocaleKeys.Yes.tr(),
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
                          context.push(AppRoutesString.forgetPasswordScreen);
                        },
                        text: LocaleKeys.Forgot_Password.tr(),
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
                      context.push(AppRoutesString.registerScreen);
                    },
                    text: LocaleKeys.Register.tr(),
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
