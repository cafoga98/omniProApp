import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:onmi_pro_app/core/error/custom_exceptions.dart';
import 'package:onmi_pro_app/data/datasource/photo_remote_datasource.dart';
import 'package:onmi_pro_app/domain/entities/photo_entity.dart';

@lazySingleton
class PhotoRepository {
  final PhotoRemoteDataSource remoteDataSource;

  PhotoRepository({required this.remoteDataSource});

  Future<Either<CustomExceptions, List<PhotoEntity>>> fetchPhotos(
      int start, int limit) async {
    try {
      final response = await remoteDataSource.fetchPhotos(start, limit);
      return Right(response);
    } catch (e) {
      return Left(e as CustomExceptions);
    }
  }
}
