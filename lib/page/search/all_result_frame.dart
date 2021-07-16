import 'package:flutter/material.dart';
import 'package:flutter_sample/bloc/search/all_search_cubit.dart';
import 'package:flutter_sample/component/progress_bar_bottom.dart';
import 'package:flutter_sample/model/user_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'all_list_item_view.dart';

class AllResultFrame extends StatelessWidget {
  const AllResultFrame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AllSearchCubit allSearchCubit = context.watch<AllSearchCubit>();
    List<User> allList = const [];
    if (allSearchCubit.state is AllSearched) {
      allList = (allSearchCubit.state as AllSearched).allList;
    }
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        ((allSearchCubit.state is AllSearched) && allList.length == 0)
            ? Visibility(
                visible: (allSearchCubit.state is AllSearched),
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
                      return index >= allList.length //&& !state.isReachMax
                          ? ProgressBarBottom()
                          : AllListItemView(user: allList[index]);
                    },
                    itemCount: allList.length
                    // state.isReachMax ? state.posts.length : state.posts.length + 1,
                    // controller: ScrollController(),
                    ),
              ),
        Visibility(
          visible: (allSearchCubit.state is AllSearching),
          child: Container(
              margin: EdgeInsets.all(20),
              width: 20,
              height: 20,
              child: CircularProgressIndicator(strokeWidth: 3)),
        ),
        Visibility(
          visible: (allSearchCubit.state is AllSearchFail),
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
