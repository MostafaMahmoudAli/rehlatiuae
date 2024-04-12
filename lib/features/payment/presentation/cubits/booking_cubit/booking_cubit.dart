import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rehlatyuae/features/payment/data/models/chechked_trips_offers_model/cart_trips.dart';
import 'package:rehlatyuae/features/payment/domain/repositories/payment_repo.dart';

part 'booking_cubit.freezed.dart';
part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  final PaymentRepo paymentRepo;

  BookingCubit({required this.paymentRepo}) : super(const BookingState.initial());

  Future<void> getBooking() async {
    _update(const BookingState.loading());
    final results = await paymentRepo.getBooking();
    results.fold(
      (error) => _update(BookingState.error(error)),
      (client) => _update(BookingState.success(client)),
    );
  }

  void _update(BookingState state) {
    if (!isClosed) {
      emit(state);
    }
  }
}
