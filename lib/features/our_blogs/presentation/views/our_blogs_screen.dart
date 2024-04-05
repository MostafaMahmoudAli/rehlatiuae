import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rehlatyuae/core/utils/custom_sized_box.dart';
import 'package:rehlatyuae/core/utils/injector.dart';
import 'package:rehlatyuae/features/our_blogs/presentation/blocs/blogs_bloc.dart';
import 'package:rehlatyuae/features/our_blogs/presentation/views/widgets/blogs_bottom_section.dart';
import 'package:rehlatyuae/generated/locale_keys.g.dart';
import '../../../../core/routes/app_routes_strings.dart';
import '../../../../core/utils/search_text_feild.dart';
import '../../data/models/blogs_model.dart';
import 'widgets/our_blogs_body.dart';

class OurBlogsScreen extends StatelessWidget {
  OurBlogsScreen({super.key});

  final ScrollController blogsScrollController = ScrollController();
  List<Blogs>? blogs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => getIt<BlogsBloc>()..add(GetBlogsEvent()),
        child: Padding(
          padding: EdgeInsetsDirectional.symmetric(
            vertical: 20.0.h,
          ),
          child: SingleChildScrollView(
            controller: blogsScrollController,
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 15.0.w,),
                  child: SearchTextField(
                    readOnly: true,
                    onTap: () {
                      context.push(
                        AppRoutesString.blogsSearchScreen,
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                    start: 12.0.w,
                    end: 12.0.w,
                    bottom: 10.0.h,
                    top:15.0.h,
                  ),
                  child: Text(
                    LocaleKeys.Our_Blog.tr(),
                  ),
                ),
                const CustomSizedBox(),
                OurBlogsBody(
                  ourBlogsScrollController: blogsScrollController,
                ),
                const CustomSizedBox(),
                const BlogsBottomSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
