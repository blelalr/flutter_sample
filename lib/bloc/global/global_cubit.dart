import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample/page/infinite/post.dart';
import 'package:flutter_sample/page/infinite/post_service.dart';
import 'package:flutter_sample/page/home/cluster_item.dart';
import 'package:flutter_sample/page/home/place.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';

part 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(GlobalInitial());

  void fetchGlobalList() async {
    try {
      if (state is GlobalInitial) {
        emit(GlobalLoading());
        final posts = await PostService.getPosts(0);
        Timer(Duration(seconds: 3), () {
          emit(GlobalLoaded(globalList: posts));
        });
      }
    } on Exception {
      emit(GlobalFail());
    }
  }

  void loadMore(int index) async {
    try {
      if (state is GlobalLoaded) {
        final totalList = List.of((state as GlobalLoaded).globalList);
        List<Post> fake = [
          Post(id: -1, userId: -1, title: 'title', body: 'body'),
          Post(id: -1, userId: -1, title: 'title', body: 'body')
        ];

        if (index == 0) {
          fake.addAll(totalList);
          emit(GlobalLoadMore(fakeLoadingList: fake));
          print('LoadLeft');
        } else {
          List<Post> temp = [];
          temp.addAll(totalList);
          temp.addAll(fake);
          emit(GlobalLoadMore(fakeLoadingList: temp));
          print('LoadRight');
        }
        final morePosts = await PostService.getPosts(totalList.length);

        if (index == 0) {
          List<Post> loadMoreList = [];
          loadMoreList.addAll(morePosts);
          loadMoreList.addAll(totalList);
          Timer(Duration(seconds: 3), () {
            emit(GlobalLoaded(
                globalList: loadMoreList, movePosition: PostService.postLimit));
          });
        } else {
          List<Post> loadMoreList = [];
          loadMoreList.addAll(totalList);
          loadMoreList.addAll(morePosts);
          Timer(Duration(seconds: 3), () {
            emit(GlobalLoaded(
                globalList: loadMoreList,
                movePosition:
                    (loadMoreList.length - 1) - PostService.postLimit));
          });
        }
      }
    } on Exception {
      emit(GlobalFail());
    }
  }

  getFakeGlobalList() => [
        ClusterItem(LatLng(24.6510782, 121.7908357),
            item: Place(name: "!A6YP14Od8!")),
        ClusterItem(LatLng(25.1262432, 121.9201409),
            item: Place(name: "!A9OUuJRDx!")),
        ClusterItem(LatLng(25.0332691, 121.5581373),
            item: Place(name: "!BF2LhdLXNV")),
        ClusterItem(LatLng(25.034936, 121.525896),
            item: Place(name: "!Ase_z9fSt!")),
        ClusterItem(LatLng(24.9031445, 121.8440946),
            item: Place(name: "!B24TTxIZb!")),
        ClusterItem(LatLng(24.829883, 121.773591),
            item: Place(name: "!B1qoJFS4H!")),
        ClusterItem(LatLng(25.0423774, 121.5462741),
            item: Place(name: "!BJpLdjrF8~")),
        ClusterItem(LatLng(25.051963806152344, 121.51969909667969),
            item: Place(name: "!ASrunKU0oV")),
        ClusterItem(LatLng(25.05727195739746, 121.61213684082031),
            item: Place(name: "!9yWGm_7EE!")),
        ClusterItem(LatLng(25.03048, 121.520574),
            item: Place(name: "!B2QZC9sW4V")),
        ClusterItem(LatLng(25.0528955, 121.6072597),
            item: Place(name: "!B0btDVLkI!"))
      ];

  fakeLoadingList() => [
        Post(id: -1, userId: -1, title: 'title', body: 'body'),
        Post(id: -1, userId: -1, title: 'title', body: 'body')
      ];
}
