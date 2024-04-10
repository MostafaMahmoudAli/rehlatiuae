import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/core/utils/injector.dart';
import '../../../../core/utils/custom_container_trip.dart';
import '../../../../core/utils/custom_dialog.dart';
import '../../../../core/utils/search_text_feild.dart';
import '../cubits/search_cubit.dart';



class SearchScreen extends StatelessWidget {
  final TextEditingController _textEditingController = TextEditingController();

  SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsDirectional.only(
          top:14.0.h,
        ),
        child: BlocProvider(
          create:(context)=>getIt<SearchCubit>(),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:EdgeInsetsDirectional.symmetric(horizontal:10.0.w,),
                  child: SearchTextField(
                    controller: _textEditingController,
                    readOnly: false,
                    onChanged: (String value)
                    {

                      getIt<SearchCubit>().fetchSearchData(name: value);
                    },
                  ),
                ),
                SizedBox(
                  height: 15.0.h,
                ),
                BlocConsumer<SearchCubit, SearchState>(
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
                      loaded: (searchList) {
                       if(searchList.isEmpty)
                       {
                         return const Center(child:  Text("No Data"));
                       }
                        return SizedBox(
                          height: MediaQuery.sizeOf(context).height,
                          child: GridView.builder(
                            gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio:
                                  MediaQuery.sizeOf(context).aspectRatio /
                                      0.58,
                              crossAxisSpacing: 10.0.w,
                              mainAxisSpacing: 2.0.w,
                            ),
                            itemBuilder: (context, index) =>
                                CustomContainerTrip(
                              width: 140.0.w,
                              cityName: searchList[index].name,
                              countryName: searchList[index].address,
                              imageName: searchList[index].imagePath ?? "",
                              tripPrice:searchList[index].adultPrice.toString(),
                              reservationType: "/person",
                                  trip:searchList[index],
                                  oldTripPrice: searchList[index].beforePrice ,
                                  percentageSave: searchList[index].saving,

                            ),
                            itemCount: searchList.length,
                            shrinkWrap: true,
                            physics: const ClampingScrollPhysics(),
                            padding: EdgeInsetsDirectional.only(
                              start:10.0.w,end: 10.0.w,
                            ),
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
