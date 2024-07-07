part of 'photo_bloc.dart';

@freezed
class PhotoEvent with _$PhotoEvent {
  const factory PhotoEvent.started() = _Started;
  const factory PhotoEvent.fetchPhotos() = _FetchPhotos;
}
