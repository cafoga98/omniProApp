part of 'photo_bloc.dart';

@freezed
class PhotoEvent with _$PhotoEvent {
  const factory PhotoEvent.fetchPhotos() = _FetchPhotos;
}
