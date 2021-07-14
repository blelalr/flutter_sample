import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample/bloc/photo/photo_cubit.dart';
import 'package:flutter_sample/bloc/search/search_cubit.dart';
import 'package:flutter_sample/bloc/theme/theme_cubit.dart';
import 'package:flutter_sample/component/common/toggle_theme.dart';
import 'package:flutter_sample/component/progress_bar_bottom.dart';
import 'package:flutter_sample/component/app_bar_search.dart';
import 'package:flutter_sample/model/photo.dart';
import 'package:flutter_sample/model/repo_data.dart';
import 'package:flutter_sample/model/user_data.dart';
import 'package:flutter_sample/res/app_colors.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => PhotoCubit()..fetchPhoto()),
      BlocProvider(create: (context) => SearchCubit()..switchToDiscoverMode()),
    ], child: SearchPageView());
  }
}

class SearchPageView extends StatelessWidget {
  const SearchPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchBloc = context.watch<SearchCubit>();
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: false,
            titleSpacing: 0,
            elevation: 0,
            actions: [ToggleTheme()],
            title: AppBarSearch(),
            bottom: searchBloc.isSearch
                ? TabBar(
                    indicatorColor: Theme.of(context).iconTheme.color,
                    isScrollable: true,
                    unselectedLabelColor: Theme.of(context).hintColor,
                    tabs: [
                      TabView(tabTitle: 'All'),
                      TabView(tabTitle: 'Locations'),
                      TabView(tabTitle: 'Users'),
                      TabView(tabTitle: 'Hashtags'),
                    ],
                  )
                : null,
          ),
          body: (searchBloc.isSearch)
              ? TabBarView(children: [
                  AllResultFrame(),
                  LocationResultFrame(),
                  UsersResultFrame(),
                  HashTagResultFrame()
                ])
              : DiscoverFrame()),
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

class TabView extends StatelessWidget {
  const TabView({Key? key, required this.tabTitle}) : super(key: key);
  final String tabTitle;
  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Container(
        padding: EdgeInsets.only(left: 12, right: 12),
        child: Text(
          '$tabTitle',
        ),
      ),
    );
  }
}

class AllResultFrame extends StatelessWidget {
  const AllResultFrame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        var users = state.userCache;
        return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return index >= users.length //&& !state.isReachMax
                  ? ProgressBarBottom()
                  : UserListItem(user: users[index]);
            },
            itemCount: users.length
            // state.isReachMax ? state.posts.length : state.posts.length + 1,
            // controller: ScrollController(),
            );
        // if (state is Searching) {
        //   return Container(
        //       padding: EdgeInsets.all(8),
        //       color: Colors.yellow,
        //       child: Align(
        //           alignment: Alignment.topCenter, child: Text('Searching')));
        // } else if (state is UserSearched) {
        //   return ListView.builder(
        //       itemBuilder: (BuildContext context, int index) {
        //         return index >= state.searchResult.length //&& !state.isReachMax
        //             ? ProgressBarBottom()
        //             : RepoListItem(user: state.searchResult[index]);
        //       },
        //       itemCount: state.searchResult.length
        //       // state.isReachMax ? state.posts.length : state.posts.length + 1,
        //       // controller: ScrollController(),
        //       );
        // } else {
        //   return Container(
        //       padding: EdgeInsets.all(8),
        //       color: Colors.lightGreen,
        //       child: Align(
        //           alignment: Alignment.topCenter, child: Text('no Result')));
        // }
      },
    );
  }
}

class UserListItem extends StatelessWidget {
  final User user;
  const UserListItem({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListTile(
        leading: ClipOval(
          child: Image.network(
            '${user.avatarUrl}',
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
        ),
        title: Text('${user.login}'),
        subtitle: Text('${user.id}'),
        dense: true,
      ),
    );
  }
}

class LocationResultFrame extends StatelessWidget {
  const LocationResultFrame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        var repoCache = state.repoCache;
        return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return index >= repoCache.length //&& !state.isReachMax
                  ? ProgressBarBottom()
                  : RepoListItem(repo: repoCache[index]);
            },
            itemCount: repoCache.length
            // state.isReachMax ? state.posts.length : state.posts.length + 1,
            // controller: ScrollController(),
            );
        // if (state is Searching) {
        //   return Container(
        //       padding: EdgeInsets.all(8),
        //       color: Colors.yellow,
        //       child: Align(
        //           alignment: Alignment.topCenter, child: Text('Searching')));
        // } else if (state is UserSearched) {
        //   return ListView.builder(
        //       itemBuilder: (BuildContext context, int index) {
        //         return index >= state.searchResult.length //&& !state.isReachMax
        //             ? ProgressBarBottom()
        //             : RepoListItem(user: state.searchResult[index]);
        //       },
        //       itemCount: state.searchResult.length
        //       // state.isReachMax ? state.posts.length : state.posts.length + 1,
        //       // controller: ScrollController(),
        //       );
        // } else {
        //   return Container(
        //       padding: EdgeInsets.all(8),
        //       color: Colors.lightGreen,
        //       child: Align(
        //           alignment: Alignment.topCenter, child: Text('no Result')));
        // }
      },
    );
  }
}

class RepoListItem extends StatelessWidget {
  final Repo repo;
  const RepoListItem({Key? key, required this.repo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListTile(
        leading: ClipOval(
          child: Image.network(
            '${repo.owner.avatarUrl}',
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
        ),
        title: Text('${repo.id}'),
        subtitle: Text('${repo.nodeId}'),
        dense: true,
      ),
    );
  }
}

class UsersResultFrame extends StatelessWidget {
  const UsersResultFrame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(8),
        color: Colors.lightGreen,
        child: Align(alignment: Alignment.topCenter, child: Text('no Result')));
  }
}

class HashTagResultFrame extends StatelessWidget {
  const HashTagResultFrame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(8),
        color: Colors.lightGreen,
        child: Align(alignment: Alignment.topCenter, child: Text('no Result')));
  }
}

class DiscoverFrame extends StatelessWidget {
  const DiscoverFrame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _scrollController = ScrollController();
    final themeBloc = context.watch<ThemeCubit>();
    final searchBloc = context.watch<SearchCubit>();
    return BlocBuilder<PhotoCubit, PhotoState>(
      builder: (context, state) {
        return NotificationListener<ScrollNotification>(
            onNotification: (scrollNotification) {
              if (scrollNotification is ScrollUpdateNotification) {
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
                                  visible: !searchBloc.isSearch,
                                  child: StaggeredGridView.countBuilder(
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
    if (metrics.extentAfter < 300) {
      context.read<PhotoCubit>().loadMore();
    }
  }
}
