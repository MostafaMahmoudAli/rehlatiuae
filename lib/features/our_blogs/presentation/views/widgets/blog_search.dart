import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/custom_dialog.dart';
import '../../../../../core/utils/injector.dart';
import '../../../../../core/utils/search_text_feild.dart';
import '../../blocs/blogs_search_cubit.dart';
import 'all_blogs_item.dart';

class BlogSearch extends StatelessWidget {
   BlogSearch({super.key});
  final TextEditingController _textEditingController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 15.0.w,
          vertical: 20.0.w,
        ),
        child: BlocProvider(
          create: (context) => getIt<BlogsSearchCubit>(),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchTextField(
                  controller: _textEditingController,
                  readOnly: false,
                  onChanged: (String value)
                  {
                    getIt<BlogsSearchCubit>().fetchSearchData(name: value);
                  },
                ),
                SizedBox(
                  height: 15.0.h,
                ),
                BlocConsumer<BlogsSearchCubit, BlogsSearchState>(
                  listener: (context, state) {
                    state.whenOrNull(
                      error: (errorMessage) => showDialog(
                        context: context,
                        builder: (context) => CustomDialog(
                          title: errorMessage,
                          subtitle: 'Sorry',
                          labelText: 'Close',
                        ),
                      ),
                    );
                  },
                  builder: (context, state) {
                    return state.maybeWhen(
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                      loaded: (blogsList) {
                        if(blogsList.isEmpty)
                        {
                          return const Center(child:  Text("No Data"));
                        }
                        return SizedBox(
                          height: 400.0.h,
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio:
                                  MediaQuery.sizeOf(context).aspectRatio / 0.58,
                              crossAxisSpacing: 10.0.w,
                              mainAxisSpacing: 1.0.w,
                            ),
                            itemBuilder: (context, index) => AllBlogsItem(
                              width: 170.0.w,
                              image: blogsList[index].imagePath ?? "",
                              rating: blogsList[index].reviewAverage.toString(),
                              createdAt: blogsList[index].createdAt.toString(),
                              name: blogsList[index].name ?? "",
                              description: blogsList[index].description ?? '',
                            ),
                            itemCount: blogsList.length,
                            shrinkWrap: true,
                            physics: const ClampingScrollPhysics(),
                            padding: EdgeInsets.zero,
                          ),
                        );
                      },
                      orElse: () => const SizedBox(),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
