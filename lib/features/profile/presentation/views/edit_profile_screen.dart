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
import 'package:rehlatyuae/core/utils/regex.dart';
import 'package:rehlatyuae/features/profile/data/models/client_model.dart';
import 'package:rehlatyuae/features/profile/presentation/cubits/edit_profile_cubit/edit_profile_cubit.dart';
import 'package:rehlatyuae/features/profile/presentation/views/widgets/profile_photo_section.dart';

class EditProfileScreen extends StatelessWidget {
  final Client client;

  const EditProfileScreen({required this.client, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EditProfileCubit>(
      create: (context) => getIt<EditProfileCubit>()..init(client),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppStrings.editProfile,
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  color: AppColors.black,
                ),
          ),
          leading: IconButton(
            onPressed: () {
              context.pop(false);
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: BlocConsumer<EditProfileCubit, EditProfileState>(
          listener: (context, state) {
            state.whenOrNull(
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
              loaded: () {
                context.pop(true);
                showDialog(
                  context: context,
                  builder: (context) => CustomDialog(
                    title: 'Your Profile Updated Successfully',
                    subtitle: 'Done',
                    labelText: 'Close',
                    onTap: () {},
                  ),
                );
              },
            );
          },
          builder: (context, state) {
            var cubit = context.read<EditProfileCubit>();
            return state.maybeWhen(
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              orElse: () => ListView(
                children: [
                  ProfilePhotoSection(
                    client: client,
                    isShowCameraIcon: true,
                    onFilePicked: (file) {
                      cubit.image = file;
                    },
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Form(
                    key: cubit.updateFormKey,
                    child: Column(
                      children: [
                        PrimaryTextField(
                          controller: cubit.fullNameEditingController,
                          hint: 'Full Name',
                          validator: (value) => AppValidator.validateName(value),
                        ),
                        PrimaryTextField(
                          controller: cubit.emailEditingController,
                          hint: 'Your Email',
                          inputType: TextInputType.emailAddress,
                          validator: (value) => AppValidator.validateEmail(value),
                        ),
                        PrimaryTextField(
                          controller: cubit.phoneEditingController,
                          hint: 'Your Phone Number',
                          inputType: TextInputType.phone,
                          validator: (value) => AppValidator.validatePhone(value),
                        ),
                        PrimaryTextField(
                          controller: cubit.addressEditingController,
                          hint: 'Your Address',
                          validator: (value) => AppValidator.validateRequired(value),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w).copyWith(
                      top: 30.h,
                    ),
                    child: CustomActionButton(
                      text: AppStrings.save,
                      borderRadius: BorderRadius.circular(16.r),
                      backGroundColor: AppColors.orange,
                      onTap: () async {
                        await cubit.editProfile(client: client);
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
