import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rehlatyuae/features/payment/data/models/chechked_trips_offers_model/selected_data.dart';

part 'checked_trips_offers_request_model.freezed.dart';
part 'checked_trips_offers_request_model.g.dart';

@freezed
class CheckedTripsAndOffersRequest with _$CheckedTripsAndOffersRequest {
  factory CheckedTripsAndOffersRequest.fromJson(Map<String, dynamic> json) =>
      _$CheckedTripsAndOffersRequestFromJson(json);

  const factory CheckedTripsAndOffersRequest({
    required String? couponName,
    required String? description,
    required List<SelectedData>? selectedData,
  }) = _CheckedTripsAndOffersRequest;
}
