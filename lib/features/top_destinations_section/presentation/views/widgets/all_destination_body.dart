import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/core/utils/injector.dart';

import '../../../../../core/utils/custom_container_trip.dart';
import '../../../../../core/utils/error_widget.dart';
import '../../../../../core/utils/whats_up_botton.dart';
import '../../blocs/all_destinations_bloc.dart';

class AllDestinationBody extends StatefulWidget {
  const AllDestinationBody({super.key,required this.allDestinationsScrollController,});
  final  ScrollController?allDestinationsScrollController;
  @override
  State<AllDestinationBody> createState() => _AllDestinationBodyState();
}

class _AllDestinationBodyState extends State<AllDestinationBody> {
  @override
  void initState() {
    super.initState();
    widget.allDestinationsScrollController?.addListener(_onScroll);
  }

  @override
  void dispose() {
    super.dispose();
    widget.allDestinationsScrollController?..removeListener(_onScroll)..dispose();
  }
  void _onScroll()
  {
    final maxScroll = widget.allDestinationsScrollController?.position.minScrollExtent;
    final currentScroll = widget.allDestinationsScrollController?.offset;
    if(currentScroll! >= (maxScroll!*0.7))
    {
      BlocProvider.of<AllDestinationsBloc>(context).add(GetAllDestinationsEvent());
      // context.read<PostsBloc>().add(GetPostsEvent());
    }
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllDestinationsBloc, AllDestinationsState>(
      builder: (context, state) {
        switch (state.status) {
          case AllDestinationsStatus.initial:
            return const Center(child: CircularProgressIndicator());
          case AllDestinationsStatus.loading:
            return const Center(child: CircularProgressIndicator());
          case AllDestinationsStatus.success:
            return Stack(
              children: [
                GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2.2 / 3,
                    crossAxisSpacing: 10.0.w,
                    mainAxisSpacing: 1.0.w,
                  ),
                  itemBuilder: (context, index) => CustomContainerTrip(
                    width: 140.0.w,
                    cityName: state.allDestination[index].name,
                    countryName:state.allDestination[index].country,
                    imageName: state.allDestination[index].imagePath ?? "",
                  ),
                  itemCount: state.allDestination.length,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  padding: EdgeInsets.zero,
                ),
                WhatsUpButton(
                  onTap: (){},
                  right: 0,
                  bottom:MediaQuery.sizeOf(context).height*0.25,
                ),
              ],
            );
          case AllDestinationsStatus.error:
            return ErrorsWidget(error: state.errMessage,);
        }
      },
    );
  }
}
