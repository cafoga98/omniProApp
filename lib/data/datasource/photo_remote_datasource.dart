import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:onmi_pro_app/core/error/custom_exceptions.dart';
import 'dart:convert';

import 'package:onmi_pro_app/data/models/photo_model.dart';

@lazySingleton
class PhotoRemoteDataSource {
  final String apiUrl = "https://jsonplaceholder.typicode.com/photos";
  final http.Client client;

  PhotoRemoteDataSource({required this.client});

  Future<List<PhotoModel>> fetchPhotos(int start, int limit) async {
    try {
      final response =
          await client.get(Uri.parse('$apiUrl?_start=$start&_limit=$limit'));

      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);
        return jsonResponse.map((photo) => PhotoModel.fromJson(photo)).toList();
      } else if (response.statusCode >= 500) {
        throw ServerException(message: 'Server error. Please try again later.');
      } else {
        throw NoDataException(message: 'Failed to load photos');
      }
    } on http.ClientException {
      throw NetworkException(
        message: 'No internet connection. Please check your network.',
      );
    }
  }
}
