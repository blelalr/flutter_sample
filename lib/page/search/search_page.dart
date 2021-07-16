import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample/bloc/photo/photo_cubit.dart';
import 'package:flutter_sample/bloc/search/location_search_cubit.dart';
import 'package:flutter_sample/bloc/search/search_bar_cubit.dart';
import 'package:flutter_sample/bloc/search/all_search_cubit.dart';
import 'package:flutter_sample/component/toggle_theme.dart';
import 'package:flutter_sample/page/search/search_bar.dart';
import 'all_result_frame.dart';
import 'discover_frame.dart';
import 'location_result_frame.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => PhotoCubit()..fetchPhoto()),
      BlocProvider(
          create: (context) => SearchBarCubit()..switchToDiscoverMode()),
      BlocProvider(create: (context) => AllSearchCubit()),
      BlocProvider(create: (context) => LocationSearchCubit())
    ], child: SearchPageView());
  }
}

class SearchPageView extends StatefulWidget {
  const SearchPageView({Key? key}) : super(key: key);

  @override
  _SearchPageViewState createState() => _SearchPageViewState();
}

class _SearchPageViewState extends State<SearchPageView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchBloc = context.watch<SearchBarCubit>();
    if (!searchBloc.isSearchMode) {
      _tabController.animateTo(
        0,
        duration: Duration(milliseconds: 100),
      );
    }
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: false,
          titleSpacing: 0,
          elevation: 0,
          actions: [ToggleTheme()],
          title: SearchBar(),
          bottom: searchBloc.isSearchMode
              ? TabBar(
                  controller: _tabController,
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
        body: (searchBloc.isSearchMode)
            ? TabBarView(controller: _tabController, children: [
                AllResultFrame(),
                LocationResultFrame(),
                UsersResultFrame(),
                HashTagResultFrame()
              ])
            : DiscoverFrame());
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
