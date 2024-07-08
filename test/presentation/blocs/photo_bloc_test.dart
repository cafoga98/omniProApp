import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:onmi_pro_app/core/error/custom_exceptions.dart';
import 'package:onmi_pro_app/data/datasource/photo_remote_datasource.dart';
import 'package:onmi_pro_app/data/models/photo_model.dart';
import 'package:onmi_pro_app/domain/entities/photo_entity.dart';
import 'package:onmi_pro_app/domain/repositories/photo_repository.dart';
import 'package:onmi_pro_app/presentation/blocs/photo_bloc.dart';

import '../../data/datasource/mock_photo_datasource.mocks.dart';
import '../../domain/mock_photo_repository.mocks.dart';
import '../../injection_test.dart';
import '../../resources/http/mock_http_client.mocks.dart';

List<Map<String, dynamic>> listPhotos = [
  {
    "albumId": 1,
    "id": 1,
    "title": "accusamus beatae ad facilis cum similique qui sunt",
    "url": "https://via.placeholder.com/600/92c952",
    "thumbnailUrl": "https://via.placeholder.com/150/92c952"
  },
  {
    "albumId": 1,
    "id": 2,
    "title": "reprehenderit est deserunt velit ipsam",
    "url": "https://via.placeholder.com/600/771796",
    "thumbnailUrl": "https://via.placeholder.com/150/771796"
  },
  {
    "albumId": 1,
    "id": 3,
    "title": "officia porro iure quia iusto qui ipsa ut modi",
    "url": "https://via.placeholder.com/600/24f355",
    "thumbnailUrl": "https://via.placeholder.com/150/24f355"
  },
  {
    "albumId": 1,
    "id": 4,
    "title": "culpa odio esse rerum omnis laboriosam voluptate repudiandae",
    "url": "https://via.placeholder.com/600/d32776",
    "thumbnailUrl": "https://via.placeholder.com/150/d32776"
  },
  {
    "albumId": 1,
    "id": 5,
    "title": "natus nisi omnis corporis facere molestiae rerum in",
    "url": "https://via.placeholder.com/600/f66b97",
    "thumbnailUrl": "https://via.placeholder.com/150/f66b97"
  },
  {
    "albumId": 1,
    "id": 6,
    "title": "accusamus ea aliquid et amet sequi nemo",
    "url": "https://via.placeholder.com/600/56a8c2",
    "thumbnailUrl": "https://via.placeholder.com/150/56a8c2"
  },
  {
    "albumId": 1,
    "id": 7,
    "title": "officia delectus consequatur vero aut veniam explicabo molestias",
    "url": "https://via.placeholder.com/600/b0f7cc",
    "thumbnailUrl": "https://via.placeholder.com/150/b0f7cc"
  },
  {
    "albumId": 1,
    "id": 8,
    "title": "aut porro officiis laborum odit ea laudantium corporis",
    "url": "https://via.placeholder.com/600/54176f",
    "thumbnailUrl": "https://via.placeholder.com/150/54176f"
  },
  {
    "albumId": 1,
    "id": 9,
    "title": "qui eius qui autem sed",
    "url": "https://via.placeholder.com/600/51aa97",
    "thumbnailUrl": "https://via.placeholder.com/150/51aa97"
  },
  {
    "albumId": 1,
    "id": 10,
    "title": "beatae et provident et ut vel",
    "url": "https://via.placeholder.com/600/810b14",
    "thumbnailUrl": "https://via.placeholder.com/150/810b14"
  }
];

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockPhotoRepository mockPhotoRepository;
  late MockPhotoRemoteDataSource mockPhotoRemoteDataSource;
  late MockHttpClient mockHttpClient;
  late PhotoBloc photoBloc;

  List<PhotoModel> photoModel =
      listPhotos.map((e) => PhotoModel.fromJson(e)).toList();

  group('PhotoBloc Tests', () {
    setUp(() {
      mockPhotoRepository = MockPhotoRepository();
      mockPhotoRemoteDataSource = MockPhotoRemoteDataSource();
      mockHttpClient = MockHttpClient();

      photoBloc = PhotoBloc(
        photoRepository: mockPhotoRepository,
      );
    });

    tearDown(() {
      getIt.reset();
    });

    blocTest<PhotoBloc, PhotoState>(
      'emits [PhotoLoading, PhotoLoaded] when FetchPhotos is added and API returns data',
      build: () {
        when(mockPhotoRemoteDataSource.fetchPhotos(0, 10))
            .thenAnswer((invocation) {
          return Future.value(photoModel);
        });

        when(mockPhotoRepository.fetchPhotos(0, 10)).thenAnswer(
          (_) async {
            return Right(photoModel);
          },
        );

        return photoBloc;
      },
      act: (bloc) => bloc.add(const FetchPhotosEvent()),
      skip: 1,
      expect: () => [
        isA<LoadedPhotoState>(),
      ],
      verify: (_) {
        verify(() => mockPhotoRepository.fetchPhotos(0, 10)).called(1);
      },
    );

    blocTest<PhotoBloc, PhotoState>(
      'emits [PhotoLoading, PhotoError] when FetchPhotos is added and API throws NetworkException',
      build: () {
        when(mockPhotoRepository.fetchPhotos(0, 10)).thenAnswer(
          (_) async => Left(
            NetworkException(
              message: 'No internet connection. Please check your network.',
            ),
          ),
        );
        return photoBloc;
      },
      act: (bloc) => bloc.add(const FetchPhotosEvent()),
      skip: 1,
      expect: () => [
        isA<ErrorPhotoState>(),
      ],
    );

    blocTest<PhotoBloc, PhotoState>(
      'emits [PhotoLoading, PhotoError] when FetchPhotos is added and API throws ServerException',
      build: () {
        when(mockPhotoRepository.fetchPhotos(0, 10)).thenAnswer(
          (_) async => Left(
            ServerException(
              message: 'Server error. Please try again later.',
            ),
          ),
        );
        return photoBloc;
      },
      act: (bloc) => bloc.add(const FetchPhotosEvent()),
      skip: 1,
      expect: () => [
        isA<ErrorPhotoState>(),
      ],
    );
  });
}
