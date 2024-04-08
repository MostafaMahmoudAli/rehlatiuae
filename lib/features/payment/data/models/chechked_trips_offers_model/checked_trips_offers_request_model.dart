import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rehlatyuae/features/payment/data/models/chechked_trips_offers_model/selected_data.dart';

part 'checked_trips_offers_request_model.g.dart';

part 'checked_trips_offers_request_model.freezed.dart';

@freezed
class CheckedTripsAndOffersRequest with _$CheckedTripsAndOffersRequest
{
  const factory CheckedTripsAndOffersRequest({
   required String? couponName,
   required List<SelectedData>? selectedData,
})=_CheckedTripsAndOffersRequest;

factory CheckedTripsAndOffersRequest.fromJson(Map<String, dynamic> json) =>
_$CheckedTripsAndOffersRequestFromJson(json);
}