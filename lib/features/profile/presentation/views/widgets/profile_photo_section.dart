import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rehlatyuae/core/utils/app_assets.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';
import 'package:rehlatyuae/core/utils/custom_circle_avatar.dart';
import 'package:rehlatyuae/features/profile/data/models/client_model.dart';

class ProfilePhotoSection extends StatefulWidget {
  final Client client;
  final bool isShowCameraIcon;
  final void Function(File file)? onFilePicked;

  const ProfilePhotoSection({
    required this.client,
    this.isShowCameraIcon = false,
    this.onFilePicked,
    super.key,
  });

  @override
  State<ProfilePhotoSection> createState() => _ProfilePhotoSectionState();
}

class _ProfilePhotoSectionState extends State<ProfilePhotoSection> {
  XFile? pickedImage;
  bool imageHasErrorWhenLoad = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Stack(
              children: [
                if (!imageHasErrorWhenLoad && pickedImage == null)
                  CustomCircleAvatar(
                    backgroundImage: CachedNetworkImageProvider(
                      widget.client.imagePath,
                      errorListener: (p0) {
                        setState(() {
                          imageHasErrorWhenLoad = true;
                        });
                      },
                    ),
                    backgroundColor: AppColors.whiteAppColor,
                    borderWidth: 10.h,
                    radius: 70.h,
                  ),
                if (imageHasErrorWhenLoad && pickedImage == null)
                  CustomCircleAvatar(
                    backgroundImage: const AssetImage(AppAssets.profile),
                    borderWidth: 10.h,
                    radius: 70.h,
                  ),
                if (widget.isShowCameraIcon && pickedImage != null)
                  CustomCircleAvatar(
                    backgroundImage: FileImage(
                      File(pickedImage!.path),
                    ),
                    borderWidth: 10.h,
                    radius: 70.h,
                  ),
                if (widget.isShowCameraIcon)
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: InkWell(
                      onTap: () async {
                        final picker = ImagePicker();
                        pickedImage = await picker.pickImage(
                          source: ImageSource.gallery,
                        );
                        if (pickedImage != null) {
                          setState(() {});
                          widget.onFilePicked?.call(File(pickedImage!.path));
                        }
                      },
                      borderRadius: BorderRadius.circular(50.r),
                      child: CustomCircleAvatar(
                        backgroundColor: AppColors.blogItemContainerBackgroundColor.withOpacity(0.5),
                        radius: 30.r,
                        iconData: CupertinoIcons.camera,
                        iconSize: 30.h,
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              widget.client.name,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            SizedBox(
              height: 7.h,
            ),
            Text(
              widget.client.email,
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: AppColors.grayLight,
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
