import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/widgets/best_offers_item.dart';

import '../../../../../core/utils/error_widget.dart';
import '../../../../../core/utils/injector.dart';
import '../../blocs/best_offers_bloc.dart';

class BestOffersBody extends StatefulWidget {
  const BestOffersBody({super.key, this.bestOffersScrollController});
  final ScrollController? bestOffersScrollController;

  @override
  State<BestOffersBody> createState() => _BestOffersBodyState();
}

class _BestOffersBodyState extends State<BestOffersBody> {
  @override
  void initState() {
    super.initState();
    widget.bestOffersScrollController?.addListener(_onScroll);
  }

  @override
  void dispose() {
    super.dispose();
    widget.bestOffersScrollController
      ?..removeListener(_onScroll)
      ..dispose();
  }

  void _onScroll() {
    final maxScroll = widget.bestOffersScrollController?.position.maxScrollExtent;
    final currentScroll = widget.bestOffersScrollController?.offset;
    if (currentScroll! >= (maxScroll! * 0.9)) {
      getIt<BestOffersBloc>().add(GetBestOffersEvent());
      // context.read<PostsBloc>().add(GetPostsEvent());
    }
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BestOffersBloc,BestOffersState>(
      builder: (context,state)
      {
        return switch(state.status){
          // TODO: Handle this case.
          BestOffersStatus.initial =>  const Center(child: CircularProgressIndicator()),
          // TODO: Handle this case.
          BestOffersStatus.loading => const Center(child: CircularProgressIndicator()),
          // TODO: Handle this case.
          BestOffersStatus.success => GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 6 / 2.7,
              mainAxisSpacing: 10.0.h,
            ),
            itemBuilder: (context, index) => BestOffersItem(
              width: 74.0.w,
              bestOffers: state.bestOffers[index],

            ),
            itemCount: state.bestOffers.length,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            padding: EdgeInsets.zero,
          ),
          // TODO: Handle this case.
          BestOffersStatus.error => ErrorsWidget(
            error: state.errMessage,
          ),
        };
      },
    );
  }
}
