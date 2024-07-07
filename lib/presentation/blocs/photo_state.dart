part of 'photo_bloc.dart';

@freezed
class PhotoState with _$PhotoState {
  const factory PhotoState.initial() = _Initial;

  const factory PhotoState.loading() = _Loading;

  const factory PhotoState.loaded({
    required List<PhotoEntity> photos,
    required int currentPage,
    required int totalPages,
  }) = _Loaded;

  const factory PhotoState.error({required CustomExceptions exception}) =
      _Error;
}
