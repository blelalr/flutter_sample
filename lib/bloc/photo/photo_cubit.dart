import 'dart:async';

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
      }
    } catch (e) {
      emit(PhotoFailed(e.toString()));
    }
  }

  void loadMore() async {
    try {
      if (state is PhotoLoaded) {
        print('LoadMore');
        var totalPhotos = List.of((state as PhotoLoaded).photos);
        emit(PhotoLoadMore(photos: totalPhotos));
        final photos = await ApiService.getPhotos(totalPhotos.length);
        totalPhotos.addAll(photos);
        Timer(Duration(seconds: 1), () {
          emit(
              PhotoLoaded(photos: totalPhotos, isReachMax: photos.length == 0));
        });
      }
    } catch (e) {
      emit(PhotoFailed(e.toString()));
    }
  }
}
