import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:onmi_pro_app/core/utils/custom_exceptions.dart';
import 'package:onmi_pro_app/data/models/photo_model.dart';
import 'package:onmi_pro_app/domain/repositories/photo_repository.dart';

part 'photo_event.dart';

part 'photo_state.dart';

part 'photo_bloc.freezed.dart';

@lazySingleton
class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  final PhotoRepository photoRepository;

  int _page = 0;
  final int _itemsPerPage = 10;
  int _totalPages = 0;

  final ScrollController scrollController = ScrollController();

  PhotoBloc({
    required this.photoRepository,
  }) : super(const PhotoState.initial()) {
    on<_Started>(_initConfig);
    on<_FetchPhotos>(_fetchPhotos);
  }

  FutureOr<void> _initConfig(_Started event, Emitter emit) {
    emit(const PhotoState.loading());
    scrollController.addListener(
      () {
        if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) {
          _fetchPhotos(event, emit);
        }
      },
    );
  }

  FutureOr<void> _fetchPhotos(PhotoEvent event, Emitter emit) async {
    emit(const PhotoState.loading());
    final response = await photoRepository.fetchPhotos(_page * 10, 10);
    response.fold(
      (exception) {
        emit(
          PhotoState.error(exception: exception),
        );
      },
      (photos) {
        if (photos.isNotEmpty) {
          _page++;
        }
        _totalPages = (5000 / _itemsPerPage).ceil();
        emit(
          PhotoState.loaded(
            photos: photos,
            currentPage: _page,
            totalPages: _totalPages,
          ),
        );
      },
    );
  }
}
