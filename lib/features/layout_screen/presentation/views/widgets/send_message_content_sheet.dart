import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';
import 'package:rehlatyuae/core/utils/custom_button.dart';
import 'package:rehlatyuae/core/utils/custom_dialog.dart';
import 'package:rehlatyuae/core/utils/injector.dart';
import 'package:rehlatyuae/core/utils/primary_text_field.dart';
import 'package:rehlatyuae/core/utils/regex.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/cubits/send_message_cubit/send_message_cubit.dart';

class SendMessageContentSheet extends StatelessWidget {
  const SendMessageContentSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SendMessageCubit>(
      create: (context) => getIt<SendMessageCubit>(),
      child: BlocConsumer<SendMessageCubit, SendMessageState>(
        listener: (context, state) {
          state.whenOrNull(
            success: () {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => PopScope(
                  canPop: false,
                  child: CustomDialog(
                    title: "Message Send Successfully",
                    subtitle: 'Done',
                    labelText: "Go Back",
                    color: AppColors.green,
                    onTap: () {
                      context.pop();
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
                  subtitle: 'Sorry',
                  labelText: 'Close',
                  color: AppColors.redAppColor,
                ),
              );
            },
          );
        },
        builder: (context, state) {
          var cubit = context.read<SendMessageCubit>();
          return state.maybeWhen(
            loading: () => Padding(
              padding: EdgeInsets.symmetric(vertical: 200.h),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
            orElse: () => Form(
              key: cubit.sendMessageFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  PrimaryTextField(
                    controller: cubit.nameEditingController,
                    validator: (value) => AppValidator.validateName(value),
                    padding: EdgeInsets.only(bottom: 20.h),
                    hint: 'Full Name',
                    textColor: AppColors.grey,
                  ),
                  PrimaryTextField(
                    controller: cubit.emailEditingController,
                    validator: (value) => AppValidator.validateEmail(value),
                    padding: EdgeInsets.only(bottom: 20.h),
                    hint: 'Your Email',
                    textColor: AppColors.grey,
                  ),
                  PrimaryTextField(
                    controller: cubit.descriptionEditingController,
                    validator: (value) => AppValidator.validateRequired(value),
                    padding: EdgeInsets.only(bottom: 20.h),
                    hint: 'Your Message...',
                    textColor: AppColors.grey,
                    isTextAria: true,
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                    child: CustomActionButton(
                      text: 'Send message',
                      borderRadius: BorderRadius.circular(16.r),
                      backGroundColor: AppColors.textAndBackgroundColorButton,
                      onTap: () async {
                        await cubit.sendMessage();
                      },
                      width: double.infinity,
                      height: 50.h,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
