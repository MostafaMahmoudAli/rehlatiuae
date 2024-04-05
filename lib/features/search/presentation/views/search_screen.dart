import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';
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
        padding: EdgeInsets.symmetric(
          horizontal: 15.0.w,
          vertical: 20.0.w,
        ),
        child: BlocProvider(
          create:(context)=>getIt<SearchCubit>(),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchTextField(
                  controller: _textEditingController,
                  readOnly: false,
                  onChanged: (String value)
                  {
                    getIt<SearchCubit>().fetchSearchData(name: value);
                  },
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
                        return SizedBox(
                          height: 400.0.h,
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio:
                                  MediaQuery.sizeOf(context).aspectRatio /
                                      0.58,
                              crossAxisSpacing: 10.0.w,
                              mainAxisSpacing: 1.0.w,
                            ),
                            itemBuilder: (context, index) =>
                                CustomContainerTrip(
                              width: 140.0.w,
                              cityName: searchList[index].name,
                              countryName: searchList[index].address,
                              imageName: searchList[index].imagePath ?? "",
                              tripPrice:
                                  searchList[index].adultPrice.toString(),
                              reservationType: "/person",
                            ),
                            itemCount: searchList.length,
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
