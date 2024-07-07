// lib/data/models/photo.dart
class PhotoModel {
  final int? id;
  final String? title;
  final String? thumbnailUrl;

  PhotoModel({
    required this.id,
    required this.title,
    required this.thumbnailUrl,
  });

  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return PhotoModel(
      id: json['id'],
      title: json['title'],
      thumbnailUrl: json['thumbnailUrl'],
    );
  }
}
