import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/core/utils/custom_container_trip.dart';
import '../../../../../core/utils/error_widget.dart';
import '../../../../best_trips/presentation/blocs/best_trips_bloc.dart';

class BestTripsBody extends StatefulWidget {
  const BestTripsBody({super.key, required this.bestTripsScrollController});

  final ScrollController? bestTripsScrollController;

  @override
  State<BestTripsBody> createState() => _AllTripsBodyState();
}

class _AllTripsBodyState extends State<BestTripsBody> {
  @override
  void initState() {
    super.initState();
    widget.bestTripsScrollController?.addListener(_onScroll);
  }

  @override
  void dispose() {
    super.dispose();
    widget.bestTripsScrollController
      ?..removeListener(_onScroll)
      ..dispose();
  }

  void _onScroll() {
    final maxScroll = widget.bestTripsScrollController?.position.minScrollExtent;
    final currentScroll = widget.bestTripsScrollController?.offset;
    if (currentScroll! >= (maxScroll! * 0.4)) {
      BlocProvider.of<BestTripsBloc>(context).add(GetBestTripsEvent());
      // context.read<PostsBloc>().add(GetPostsEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BestTripsBloc, BestTripsState>(
      builder: (context, state) {
        switch (state.status) {
          case BestTripsStatus.initial:
            return const Center(child: CircularProgressIndicator());
          case BestTripsStatus.loading:
            return const Center(child: CircularProgressIndicator());
          case BestTripsStatus.success:
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2.2 / 3,
                crossAxisSpacing: 10.0.w,
                mainAxisSpacing: 1.0.w,
              ),
              itemBuilder: (context, index) => CustomContainerTrip(
                width: 140.0.w,
                trip: state.bestTrips[index],
                cityName: state.bestTrips[index].name,
                countryName: state.bestTrips[index].address,
                imageName: state.bestTrips[index].imagePath ?? "",
                tripPrice: state.bestTrips[index].adultPrice.toString(),
                reservationType: "/person",
              ),
              itemCount: state.bestTrips.length,
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              padding: EdgeInsets.zero,
            );
          case BestTripsStatus.error:
            return ErrorsWidget(
              error: state.errMessage,
            );
        }
      },
    );
  }
}
