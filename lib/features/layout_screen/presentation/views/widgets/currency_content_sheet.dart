import 'package:currency_converter/currency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/cubits/main_cubit/main_cubit.dart';
import 'package:rehlatyuae/features/our_blogs/presentation/views/widgets/row_details.dart';

class CurrencyContentSheet extends StatelessWidget {
  const CurrencyContentSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(
          context.read<MainCubit>().currencies.length,
          (index) {
            var cubit = context.read<MainCubit>();
            return RowDetails(
              title: AllCurrency.allCurrencyWithCountries[cubit.currencies[index].name] ?? '',
              value: cubit.currencies[index].name.toUpperCase(),
              onTap: () {
                cubit.currentCurrency = cubit.currencies[index];
                cubit.convert();
              },
            );
          },
        ),
        SizedBox(
          height: 50.h,
        ),
      ],
    );
  }
}
