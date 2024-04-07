import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/core/utils/custom_container_trip.dart';
import '../../../../../core/utils/error_widget.dart';
import '../../blocs/all_trips_bloc.dart';

class AllTripsBody extends StatefulWidget {
  const AllTripsBody({super.key, required this.allTripsScrollController});

  final ScrollController? allTripsScrollController;

  @override
  State<AllTripsBody> createState() => _AllTripsBodyState();
}

class _AllTripsBodyState extends State<AllTripsBody> {
  @override
  void initState() {
    super.initState();
    widget.allTripsScrollController?.addListener(_onScroll);
  }

  @override
  void dispose() {
    super.dispose();
    widget.allTripsScrollController
      ?..removeListener(_onScroll)
      ..dispose();
  }

  void _onScroll() {
    final maxScroll = widget.allTripsScrollController?.position.minScrollExtent;
    final currentScroll = widget.allTripsScrollController?.offset;
    if (currentScroll! >= (maxScroll! * 0.9)) {
      BlocProvider.of<AllTripsBloc>(context).add(GetAllTripsEvent());
      // context.read<PostsBloc>().add(GetPostsEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllTripsBloc, AllTripsState>(
      builder: (context, state) {
        switch (state.status) {
          case AllTripsStatus.initial:
            return const Center(child: CircularProgressIndicator());
          case AllTripsStatus.loading:
            return const Center(child: CircularProgressIndicator());
          case AllTripsStatus.success:
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: MediaQuery.sizeOf(context).aspectRatio/0.6,
                crossAxisSpacing: 10.0.w,
                mainAxisSpacing: 1.0.w,
              ),
              itemBuilder: (context, index) => CustomContainerTrip(
                width: 140.0.w,
                trip: state.trips[index],
                cityName: state.trips[index].name,
                countryName: state.trips[index].address,
                imageName: state.trips[index].imagePath ?? "",
                tripPrice: state.trips[index].adultPrice.toString(),
                reservationType: "/person",
                oldTripPrice: state.trips[index].beforePrice,
                percentageSave: state.trips[index].saving,
              ),
              itemCount: state.trips.length,
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              padding: EdgeInsets.zero,
            );
          case AllTripsStatus.error:
            return ErrorsWidget(
              error: state.errMessage,
            );
        }
      },
    );
  }
}
