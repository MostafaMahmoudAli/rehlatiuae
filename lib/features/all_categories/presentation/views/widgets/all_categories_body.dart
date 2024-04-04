import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/widgets/categories_item.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/error_widget.dart';
import '../../blocs/categories_bloc.dart';

class AllCategoriesBody extends StatefulWidget {
   const AllCategoriesBody({super.key, required this.scrollCategoriesController});
 final  ScrollController?scrollCategoriesController;
  @override
  State<AllCategoriesBody> createState() => _AllCategoriesBodyState();
}

class _AllCategoriesBodyState extends State<AllCategoriesBody> {

  @override
  void initState() {
    super.initState();
    widget.scrollCategoriesController?.addListener(_onScroll);
  }

  @override
  void dispose() {
    super.dispose();
    widget.scrollCategoriesController?..removeListener(_onScroll)..dispose();
  }
  void _onScroll()
  {
    final maxScroll = widget.scrollCategoriesController?.position.minScrollExtent;
    final currentScroll = widget.scrollCategoriesController?.offset;
    if(currentScroll! >= (maxScroll!*0.4))
    {
      BlocProvider.of<CategoriesBloc>(context).add(GetCategoriesEvent());
      // context.read<PostsBloc>().add(GetPostsEvent());
    }
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesBloc,CategoriesState>(
      builder: (context,state) {
        switch(state.status){
          case CategoriesStatus.initial:
          return const Center(child:  CircularProgressIndicator());
          case CategoriesStatus.loading:
            return const Center(child:  CircularProgressIndicator());
          case CategoriesStatus.success:
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:2,
                childAspectRatio:5/2.5,
                crossAxisSpacing:14.0.w,
                mainAxisSpacing: 1.0.w,
              ),
              itemBuilder: (context,index)=>  InkWell(
                onTap:()
                {
                  context.push(AppStrings.categoryNameScreen,extra:state.categories[index]);
                },
                child: Center(
                  child:CategoriesItem(
                    width: 150.0.w,
                    height: 60.0.h,
                    image: state.categories[index].imagePath ?? "",
                    categoryName:state.categories[index].name ?? "",
                  ),
                ),
              ),
              itemCount:state.categories.length,
              shrinkWrap:true,
              physics:const ClampingScrollPhysics(),
              padding:EdgeInsets.zero,
            );
          case CategoriesStatus.error:
          return  ErrorsWidget(
            error: state.errMessage,
          );
        }

      },
    );
  }


}
