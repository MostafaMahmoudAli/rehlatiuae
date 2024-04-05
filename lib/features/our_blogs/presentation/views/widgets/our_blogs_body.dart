import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/features/our_blogs/presentation/views/widgets/all_blogs_item.dart';
import '../../../../../core/utils/error_widget.dart';
import '../../blocs/blogs_bloc.dart';

class OurBlogsBody extends StatefulWidget {
  const OurBlogsBody({super.key, this.ourBlogsScrollController,});
  final ScrollController? ourBlogsScrollController;

  @override
  State<OurBlogsBody> createState() => _OurBlogsBodyState();
}

class _OurBlogsBodyState extends State<OurBlogsBody> {
  @override
  void initState() {
    super.initState();
    widget.ourBlogsScrollController?.addListener(_onScroll);
  }

  @override
  void dispose() {
    super.dispose();
    widget.ourBlogsScrollController
      ?..removeListener(_onScroll)
      ..dispose();
  }

  void _onScroll() {
    final maxScroll = widget.ourBlogsScrollController?.position.maxScrollExtent;
    final currentScroll = widget.ourBlogsScrollController?.offset;
    if (currentScroll! >= (maxScroll! * 0.9)) {
      BlocProvider.of<BlogsBloc>(context).add(GetBlogsEvent());
      // context.read<PostsBloc>().add(GetPostsEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlogsBloc, BlogsState>(
      builder: (context, state) {
        return switch (state.status) {
          BlogsStatus.initial =>
            const Center(child: CircularProgressIndicator()),
          BlogsStatus.loading =>
            const Center(child: CircularProgressIndicator()),
          BlogsStatus.success => GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: MediaQuery.sizeOf(context).aspectRatio/0.45,
                crossAxisSpacing: 8.0.w,
                mainAxisSpacing: 10.0.w,
              ),
              itemBuilder: (context, index) {
                return AllBlogsItem(
                  width: 170.0.w,
                  image: state.blogs[index].imagePath ?? "",
                  rating: state.blogs[index].reviewAverage.toString(),
                  createdAt: state.blogs[index].createdAt.toString(),
                  name: state.blogs[index].name ?? "",
                  description: state.blogs[index].description ?? '',
                );
              },
              itemCount: state.blogs.length,
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              padding: EdgeInsets.zero,
            ),
          BlogsStatus.error => ErrorsWidget(
              error: state.errMessage,
            ),
        };
      },
    );
  }
}
