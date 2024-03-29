import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/core/utils/app_strings.dart';

import '../../../data/models/our_partners_model.dart';

class OurPartnersItem extends StatelessWidget {
  const OurPartnersItem({super.key,required this.ourPartners});
final OurPartners?ourPartners;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75.0.w,
      height:70.0.h,
      decoration:  BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            ourPartners?.imagePath??AppStrings.ourPartnersLogo,
          ),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
