import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample/bloc/photo/photo_cubit.dart';
import 'package:flutter_sample/bloc/theme/theme_cubit.dart';
import 'package:flutter_sample/component/loader_bottom.dart';
import 'package:flutter_sample/component/app_bar_search.dart';
import 'package:flutter_sample/model/photo.dart';
import 'package:flutter_sample/res/app_colors.dart';
import 'package:flutter_sample/res/app_fonts.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PhotoCubit>(
      create: (context) => PhotoCubit()..fetchPhoto(),
      child: Scaffold(body: SearchPageView()),
    );
  }
}

class SearchPageView extends StatefulWidget {
  const SearchPageView({Key? key}) : super(key: key);

  @override
  _SearchPageViewState createState() => _SearchPageViewState();
}

class _SearchPageViewState extends State<SearchPageView> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  _onUpdateScroll(ScrollMetrics metrics) {
    // final maxScroll = metrics.maxScrollExtent;
    // final currentScroll = metrics.pixels;
    // if (currentScroll >= (maxScroll * 0.8)) {
    //   context.read<PhotoCubit>().loadMore();
    // }
    if (metrics.extentAfter < 300) {
      context.read<PhotoCubit>().loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeBloc = context.watch<ThemeCubit>();
    return BlocBuilder<PhotoCubit, PhotoState>(
      builder: (context, state) {
        return NotificationListener<ScrollNotification>(
            onNotification: (scrollNotification) {
              if (scrollNotification is ScrollUpdateNotification) {
                _onUpdateScroll(scrollNotification.metrics);
              }
              return false;
            },
            child: RefreshIndicator(
                onRefresh: () async {
                  await Future.delayed(Duration(seconds: 3));
                },
                child: DefaultTabController(
                  length: 4,
                  child: (state is PhotoLoading)
                      ? const Center(child: CircularProgressIndicator())
                      : CustomScrollView(
                          physics: ClampingScrollPhysics(),
                          controller: _scrollController,
                          slivers: [
                              SliverToBoxAdapter(
                                  child: SafeArea(
                                child: Column(children: [
                                  AppBarSearch(),
                                  TabBar(
                                      indicatorColor:
                                          Theme.of(context).iconTheme.color,
                                      isScrollable: true,
                                      tabs: [
                                        Tab(
                                          child: Container(
                                            padding: EdgeInsets.only(
                                                left: 12, right: 12),
                                            child: Text('All'),
                                          ),
                                        ),
                                        Tab(
                                            child: Container(
                                          padding: EdgeInsets.only(
                                              left: 12, right: 12),
                                          child: Text('Locations'),
                                        )),
                                        Tab(
                                            child: Container(
                                                padding: EdgeInsets.only(
                                                    left: 12, right: 12),
                                                child: Text('Users'))),
                                        Tab(
                                            child: Container(
                                                padding: EdgeInsets.only(
                                                    left: 12, right: 12),
                                                child: Text('Hashtags'))),
                                      ]),
                                  StaggeredGridView.countBuilder(
                                    controller: _scrollController,
                                    shrinkWrap: true,
                                    crossAxisCount: 6,
                                    crossAxisSpacing: 1,
                                    mainAxisSpacing: 1,
                                    itemCount: photosListSize(state),
                                    itemBuilder: (context, index) {
                                      if (state is PhotoLoaded) {
                                        return PhotoItem(
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
                                          return PhotoItem(
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
                                ]),
                              )),
                              SliverToBoxAdapter(
                                child: Visibility(
                                    visible: (state is PhotoLoadMore),
                                    child: LoaderBottom()),
                              ),
                            ]),
                )));
      },
    );
  }
}

photosListSize(PhotoState state) {
  if (state is PhotoLoaded) {
    return state.photos.length;
  } else if (state is PhotoLoadMore) {
    return state.photos.length + 3;
  } else {
    return 0;
  }
}

class PhotoItem extends StatelessWidget {
  final Photo? photo;
  const PhotoItem({Key? key, this.photo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Image.network(
      '${photo?.thumbnailUrl}',
      fit: BoxFit.cover,
    ));
  }
}
