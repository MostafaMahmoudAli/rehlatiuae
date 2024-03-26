import 'package:freezed_annotation/freezed_annotation.dart';

part 'all_destination_model.freezed.dart';

part 'all_destination_model.g.dart';

@freezed
class AllDestinations with _$AllDestinations
{
  const factory AllDestinations({
    required final int? id,
    required final String? name,
    required final String? description,
    required final String? imagePath,
    required final String? country,
  }) = _AllDestinations;

  factory AllDestinations.fromJson(Map<String, dynamic> json) =>
      _$AllDestinationsFromJson(json);
}
