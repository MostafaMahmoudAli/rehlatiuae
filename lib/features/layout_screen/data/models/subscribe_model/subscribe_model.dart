import 'package:freezed_annotation/freezed_annotation.dart';

part 'subscribe_model.freezed.dart';
part 'subscribe_model.g.dart';

@freezed
class SubscribeModel with _$SubscribeModel
{
  const factory SubscribeModel({
    required final String name,
    required final String email,
  }) = _SubscribeModel;
  factory SubscribeModel.fromJson(Map<String, dynamic> json) =>
      _$SubscribeModelFromJson(json);
}