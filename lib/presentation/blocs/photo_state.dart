part of 'photo_bloc.dart';

@freezed
class PhotoState with _$PhotoState {
  const factory PhotoState.initial() = InitialPhotoState;

  const factory PhotoState.loading() = LoadingPhotoState;

  const factory PhotoState.loaded({
    required List<PhotoEntity> photos,
    required int currentPage,
    required int totalPages,
  }) = LoadedPhotoState;

  const factory PhotoState.error({required CustomExceptions exception}) =
      ErrorPhotoState;
/*
  @override
  // TODO: implement props
  List<Object?> get props => [InitialPhotoState., LoadingPhotoState, LoadedPhotoState, ErrorPhotoState];*/
}
