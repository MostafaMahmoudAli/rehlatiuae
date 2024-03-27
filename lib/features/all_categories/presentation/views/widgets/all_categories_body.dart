import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/widgets/categories_item.dart';

class AllCategoriesBody extends StatelessWidget {
  const AllCategoriesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount:2,
        childAspectRatio:5/2.5,
        crossAxisSpacing:14.0.w,
        mainAxisSpacing: 1.0.w,
      ),
      itemBuilder: (context,index)=>  Center(
        child:CategoriesItem(
        width: 150.0.w,
        height: 60.0.h,
          image: '',
          categoryName: '',
      ),
      ),
      itemCount:8,
      shrinkWrap:true,
      physics:const ClampingScrollPhysics(),
      padding:EdgeInsets.zero,
    );
  }
}
