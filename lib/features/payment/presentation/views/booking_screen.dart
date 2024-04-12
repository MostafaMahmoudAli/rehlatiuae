import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';
import 'package:rehlatyuae/core/utils/injector.dart';
import 'package:rehlatyuae/features/payment/presentation/cubits/booking_cubit/booking_cubit.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<BookingCubit>()..getBooking(),
      child: BlocBuilder<BookingCubit, BookingState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            success: (bookings) => ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 15.w).copyWith(top: 30.h),
              itemCount: bookings.length,
              separatorBuilder: (context, index) => SizedBox(
                height: 25.h,
              ),
              itemBuilder: (context, index) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    bookings[index].trip?.name ?? 'Atlantis Aquaventure Waterpark',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: AppColors.grey,
                        ),
                  ),
                  Row(
                    children: [
                      Text(
                        '${bookings[index].total} \$',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        'paid',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: AppColors.grey,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            orElse: () => const SizedBox(),
          );
        },
      ),
    );
  }
}
