import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_sample/api/api_service.dart';
import 'package:meta/meta.dart';

part 'photo_state.dart';

class PhotoCubit extends Cubit<PhotoState> {
  PhotoCubit() : super(PhotoInitial());

  void fetchPhoto() async {
    try {
      if (state is PhotoInitial) {
        emit(PhotoLoading());
        final photos = await ApiService.getPhotos(0);
        emit(PhotoLoaded(photos: photos, isReachMax: photos.isEmpty));
      } else if (state is PhotoLoaded) {
        var totalPhotos = List.of((state as PhotoLoaded).photos);
        final photos = await ApiService.getPhotos(totalPhotos.length);
        totalPhotos.addAll(photos);
        emit(PhotoLoaded(photos: totalPhotos, isReachMax: photos.length == 0));
      }
    } catch (e) {
      emit(PhotoFailed(e.toString()));
    }
  }
}
