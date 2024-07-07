import 'package:equatable/equatable.dart';

class PhotoEntity extends Equatable {
  final int albumId;
  final int id;
  final String? title;
  final String? thumbnailUrl;

  const PhotoEntity({
    required this.albumId,
    required this.id,
    required this.title,
    required this.thumbnailUrl,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        albumId,
        id,
        title,
        thumbnailUrl,
      ];
}
