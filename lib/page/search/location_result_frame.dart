import 'package:flutter/material.dart';
import 'package:flutter_sample/bloc/search/location_search_cubit.dart';
import 'package:flutter_sample/component/progress_bar_bottom.dart';
import 'package:flutter_sample/model/repo_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'location_list_item_view.dart';

class LocationResultFrame extends StatelessWidget {
  const LocationResultFrame({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    LocationSearchCubit repoSearchCubit = context.watch<LocationSearchCubit>();
    List<Repo> repos = const [];
    if (repoSearchCubit.state is LocationSearched) {
      repos = (repoSearchCubit.state as LocationSearched).locationList;
    }
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        ((repoSearchCubit.state is LocationSearched) &&
                (repoSearchCubit.state as LocationSearched)
                        .locationList
                        .length ==
                    0)
            ? Visibility(
                visible: (repoSearchCubit.state is LocationSearched),
                child: Container(
                    padding: EdgeInsets.all(8),
                    color: Colors.lightGreen,
                    child: Align(
                        alignment: Alignment.topCenter,
                        child: Text('no Result'))))
            : Container(
                color: Colors.deepPurpleAccent,
                child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return index >= repos.length //&& !state.isReachMax
                          ? ProgressBarBottom()
                          : LocationListItemView(repo: repos[index]);
                    },
                    itemCount: repos.length
                    // state.isReachMax ? state.posts.length : state.posts.length + 1,
                    // controller: ScrollController(),
                    ),
              ),
        Visibility(
          visible: (repoSearchCubit.state is LocationSearching),
          child: Container(
              margin: EdgeInsets.all(20),
              width: 20,
              height: 20,
              child: CircularProgressIndicator(strokeWidth: 3)),
        ),
        Visibility(
          visible: (repoSearchCubit.state is LocationSearchFail),
          child: Container(
              padding: EdgeInsets.all(8),
              color: Colors.orangeAccent,
              child:
                  Align(alignment: Alignment.topCenter, child: Text('Fail'))),
        ),
      ],
    );
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
  }
}
