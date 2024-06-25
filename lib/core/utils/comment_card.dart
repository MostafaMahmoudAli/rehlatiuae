import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';
import 'package:rehlatyuae/core/utils/custom_circle_avatar.dart';

class CommentCard extends StatelessWidget {
  final String imageUrl;
  final String? attachmentUrl;
  final String name;
  final String date;
  final String comment;
  final bool hasActionsIcons;
  final void Function()? onDeleteTap;
  final void Function()? onEditTap;

  const CommentCard({
    required this.imageUrl,
    required this.attachmentUrl,
    required this.name,
    required this.date,
    required this.comment,
    this.hasActionsIcons = false,
    this.onDeleteTap,
    this.onEditTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CustomCircleAvatar(
                    radius: 30,
                    backgroundImage: CachedNetworkImageProvider(
                      imageUrl,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        date,
                        style: Theme.of(context).textTheme.displaySmall!.copyWith(
                              color: AppColors.grayLight,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
              if (hasActionsIcons)
                Column(
                  children: [
                    InkWell(
                      onTap: onDeleteTap,
                      borderRadius: BorderRadius.circular(30.r),
                      child: Padding(
                        padding: EdgeInsets.all(8.0.h),
                        child: const Icon(
                          CupertinoIcons.trash,
                          color: AppColors.redAppColor,
                          size: 20,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: onEditTap,
                      borderRadius: BorderRadius.circular(30.r),
                      child: Padding(
                        padding: EdgeInsets.all(8.0.h),
                        child: const Icon(
                          Icons.edit_outlined,
                          color: AppColors.textAndBackgroundColorButton,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            comment,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          if (attachmentUrl != null)
            Container(
              height: 250.h,
              width: double.infinity,
              margin: EdgeInsets.only(top: 10.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                image: DecorationImage(
                  image: CachedNetworkImageProvider(attachmentUrl!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
