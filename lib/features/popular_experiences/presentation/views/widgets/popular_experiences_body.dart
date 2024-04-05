import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/features/popular_experiences/presentation/views/widgets/popular_experiences_contanier_item.dart';

import '../../../../../core/utils/error_widget.dart';
import '../../blocs/popular_experiences_bloc.dart';

class PopularExperiencesBody extends StatefulWidget {
  const PopularExperiencesBody(
      {super.key, required this.popularExperiencesScrollController});

  final ScrollController? popularExperiencesScrollController;

  @override
  State<PopularExperiencesBody> createState() => _PopularExperiencesBodyState();
}

class _PopularExperiencesBodyState extends State<PopularExperiencesBody> {
  @override
  void initState() {
    super.initState();
    widget.popularExperiencesScrollController?.addListener(_onScroll);
  }

  @override
  void dispose() {
    super.dispose();
    widget.popularExperiencesScrollController
      ?..removeListener(_onScroll)
      ..dispose();
  }

  void _onScroll() {
    final maxScroll =
        widget.popularExperiencesScrollController?.position.maxScrollExtent;
    final currentScroll = widget.popularExperiencesScrollController?.offset;
    if (currentScroll! >= (maxScroll! * 0.7)) {
      BlocProvider.of<PopularExperiencesBloc>(context)
          .add(GetPopularExperiencesEvent());
      // context.read<PostsBloc>().add(GetPostsEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularExperiencesBloc, PopularExperiencesState>(
      builder: (context, state) {
        switch (state.status) {
          case PopularExperiencesStatus.initial:
            return const Center(child: CircularProgressIndicator());
          case PopularExperiencesStatus.loading:
            return const Center(child: CircularProgressIndicator());
          case PopularExperiencesStatus.success:
            return Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10.0.w),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: MediaQuery.sizeOf(context).aspectRatio/0.5,
                  crossAxisSpacing: 10.0.w,
                  mainAxisSpacing: 10.0.w,
                ),
                itemBuilder: (context, index) => PopularExperiencesContainerItem(
                  width: 140.w,
                  popularExperiences: state.popularExperiences[index],
                  oldTripPrice: state.popularExperiences[index].beforePrice ?? "",
                  percentageSave: state.popularExperiences[index].saving ?? "",
                ),
                itemCount: state.popularExperiences.length,
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                padding: EdgeInsets.zero,
              ),
            );
          case PopularExperiencesStatus.error:
            return ErrorsWidget(
              error: state.errMessage,
            );
        }
      },
    );
  }
}
