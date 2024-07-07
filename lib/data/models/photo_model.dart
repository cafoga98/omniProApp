import 'package:json_annotation/json_annotation.dart';
import 'package:onmi_pro_app/domain/entities/photo_entity.dart';

part 'photo_model.g.dart';

@JsonSerializable()
class PhotoModel extends PhotoEntity {
  const PhotoModel({
    required super.albumId,
    required super.id,
    required super.title,
    required super.thumbnailUrl,
  });

  factory PhotoModel.fromJson(Map<String, dynamic> json) =>
      _$PhotoModelFromJson(json);
}
