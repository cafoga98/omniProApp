import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:onmi_pro_app/core/utils/custom_exceptions.dart';
import 'package:onmi_pro_app/data/datasource/photo_remote_datasource.dart';
import 'package:onmi_pro_app/data/models/photo_model.dart';

@lazySingleton
class PhotoRepository {
  final PhotoRemoteDataSource remoteDataSource;

  PhotoRepository({required this.remoteDataSource});

  Future<Either<CustomExceptions, List<PhotoModel>>> fetchPhotos(
      int start, int limit) async {
    try {
      final response = await remoteDataSource.fetchPhotos(start, limit);
      return Right(response);
    } catch (e) {
      return Left(e as CustomExceptions);
    }
  }
}
