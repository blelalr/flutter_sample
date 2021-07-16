import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample/bloc/photo/photo_cubit.dart';
import 'package:flutter_sample/bloc/search/search_bar_cubit.dart';
import 'package:flutter_sample/bloc/theme/theme_cubit.dart';
import 'package:flutter_sample/component/progress_bar_bottom.dart';
import 'package:flutter_sample/page/search/photo_item_view.dart';
import 'package:flutter_sample/res/app_colors.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class DiscoverFrame extends StatelessWidget {
  const DiscoverFrame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _scrollController = ScrollController();
    final themeBloc = context.watch<ThemeCubit>();
    final searchBloc = context.watch<SearchBarCubit>();
    return BlocBuilder<PhotoCubit, PhotoState>(
      builder: (context, state) {
        return NotificationListener<ScrollNotification>(
            onNotification: (scrollNotification) {
              if (scrollNotification is ScrollStartNotification) {
                _onUpdateScroll(scrollNotification.metrics, context);
              }
              return false;
            },
            child: RefreshIndicator(
                onRefresh: () async {
                  await Future.delayed(Duration(seconds: 3));
                },
                child: (state is PhotoLoading)
                    ? const Center(child: CircularProgressIndicator())
                    : CustomScrollView(
                        physics: ClampingScrollPhysics(),
                        controller: _scrollController,
                        slivers: [
                            SliverToBoxAdapter(
                                child: SafeArea(
                              child: Column(children: [
                                Visibility(
                                  visible: !searchBloc.isSearchMode,
                                  child: StaggeredGridView.countBuilder(
                                    controller: _scrollController,
                                    shrinkWrap: true,
                                    crossAxisCount: 6,
                                    crossAxisSpacing: 1,
                                    mainAxisSpacing: 1,
                                    itemCount: _photosListSize(state),
                                    itemBuilder: (context, index) {
                                      if (state is PhotoLoaded) {
                                        return PhotoItemView(
                                            photo: state.photos[index]);
                                      } else if (state is PhotoLoadMore) {
                                        if (index > state.photos.length - 1) {
                                          return Shimmer(
                                              enabled: true,
                                              child: Container(
                                                  color: themeBloc.isDarkMode
                                                      ? AppColors
                                                          .backgroundDarkB1
                                                      : AppColors
                                                          .backgroundLightB1));
                                        } else {
                                          return PhotoItemView(
                                              photo: state.photos[index]);
                                        }
                                      } else {
                                        return Shimmer(
                                            enabled: true,
                                            child: Container(
                                                color: themeBloc.isDarkMode
                                                    ? AppColors.backgroundDarkB1
                                                    : AppColors
                                                        .backgroundLightB1));
                                      }
                                    },
                                    staggeredTileBuilder: (index) =>
                                        StaggeredTile.count(
                                            (index % 12 == 7) ||
                                                    (index % 12 == 0)
                                                ? 4
                                                : 2,
                                            (index % 12 == 7) ||
                                                    (index % 12 == 0)
                                                ? 6
                                                : 3),
                                  ),
                                ),
                              ]),
                            )),
                            SliverToBoxAdapter(
                              child: Visibility(
                                  visible: (state is PhotoLoadMore),
                                  child: ProgressBarBottom()),
                            ),
                          ])));
      },
    );
  }

  _onUpdateScroll(ScrollMetrics metrics, BuildContext context) {
    // final maxScroll = metrics.maxScrollExtent;
    // final currentScroll = metrics.pixels;
    // if (currentScroll >= (maxScroll * 0.8)) {
    //   context.read<PhotoCubit>().loadMore();
    // }
    var height = (MediaQuery.of(context).size.height) - 100;
    if (metrics.extentAfter / height < 0.1) {
      context.read<PhotoCubit>().loadMore();
    }
  }

  _photosListSize(PhotoState state) {
    if (state is PhotoLoaded) {
      return state.photos.length;
    } else if (state is PhotoLoadMore) {
      return state.photos.length + 3;
    } else {
      return 0;
    }
  }
}
