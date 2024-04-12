import 'package:freezed_annotation/freezed_annotation.dart';

part 'social_media_model.freezed.dart';
part 'social_media_model.g.dart';

@freezed
class SocialMedia with _$SocialMedia {
  const factory SocialMedia({
    required final int id,
    required final String whatsApp,
    required final String facebook,
    required final String youtube,
    required final String twitter,
    required final String instagram,
    required final String linkedIn,
  }) = _SocialMedia;

  factory SocialMedia.fromJson(Map<String, dynamic> json) => _$SocialMediaFromJson(json);
}
