import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/widgets/best_offers_item.dart';
import '../../../../../core/utils/error_widget.dart';
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
    final maxScroll = widget.bestOffersScrollController?.position.minScrollExtent;
    final currentScroll = widget.bestOffersScrollController?.offset;
    if (currentScroll! >= (maxScroll! * 0.9))
    {
      BlocProvider.of<BestOffersBloc>(context).add(GetBestOffersEvent());
      // context.read<PostsBloc>().add(GetPostsEvent());
    }
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BestOffersBloc,BestOffersState>(
      builder: (context,state)
      {
        return switch(state.status){

          BestOffersStatus.initial =>  const Center(child: CircularProgressIndicator()),

          BestOffersStatus.loading => const Center(child: CircularProgressIndicator()),

          BestOffersStatus.success => Padding(
            padding:  EdgeInsets.symmetric(horizontal: 10.0.w),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio:MediaQuery.sizeOf(context).aspectRatio/0.24,
                mainAxisSpacing: 10.0.h,
              ),
              itemBuilder: (context, index) => BestOffersItem(
                width: 74.0.w,
                bestOffers: state.bestOffers[index],
                // review:state.bestOffers[index].reviews?[index],
              ),
              itemCount: state.bestOffers.length,
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              padding: EdgeInsets.zero,
            ),
          ),

          BestOffersStatus.error => ErrorsWidget(
            error: state.errMessage,
          ),
        };
      },
    );
  }
}
