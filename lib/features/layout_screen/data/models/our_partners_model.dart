import 'package:freezed_annotation/freezed_annotation.dart';

part 'our_partners_model.freezed.dart';
part 'our_partners_model.g.dart';

@freezed
class OurPartners with _$OurPartners
{
  const factory OurPartners({
   required final int? id,
   required final String? name,
   required final String? description,
   required final String? imagePath,
})= _OurPartners;

factory OurPartners.fromJson(Map<String, dynamic> json) =>
_$OurPartnersFromJson(json);
}