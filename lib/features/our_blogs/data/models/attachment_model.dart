import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../best_offers/data/models/images_model.dart';
part 'attachment_model.g.dart';
part 'attachment_model.freezed.dart';


@freezed
class Attachment with _$Attachment
{
  const factory Attachment({
    final int? id,
    final int? blogId,
    final List<ImagesModel>? images,
    final List<dynamic>? videos,
    final List<dynamic>? documents,
})=_Attachment;
  factory Attachment.fromJson(Map<String, dynamic> json) =>
      _$AttachmentFromJson(json);
}