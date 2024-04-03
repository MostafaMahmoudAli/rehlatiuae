import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'subscription_section_state.dart';
part 'subscription_section_cubit.freezed.dart';

class SubscriptionSectionCubit extends Cubit<SubscriptionSectionState> {
  SubscriptionSectionCubit() : super(const SubscriptionSectionState.initial());
}
