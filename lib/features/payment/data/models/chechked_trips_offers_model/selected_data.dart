import 'package:freezed_annotation/freezed_annotation.dart';

part 'selected_data.freezed.dart';
part 'selected_data.g.dart';

@freezed
class SelectedData with _$SelectedData
{
  const factory SelectedData({
   required final bool? checkIsTrip,
   required final int? id,
   required final DateTime? date,
    @JsonKey(name:  "quantity_old")
   required final int? quantityOld,
    @JsonKey(name: "quantity_young")
   required final int? quantityYoung,
})=_SelectedData;
  factory SelectedData.fromJson(Map<String, dynamic> json) =>
      _$SelectedDataFromJson(json);
}