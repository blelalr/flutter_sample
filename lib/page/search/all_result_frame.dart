import 'package:flutter/material.dart';
import 'package:flutter_sample/bloc/search/all_search_cubit.dart';
import 'package:flutter_sample/component/progress_bar_bottom.dart';
import 'package:flutter_sample/model/user_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'list_item_view.dart';

class AllResultFrame extends StatelessWidget {
  const AllResultFrame({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    AllSearchState state = context.watch<AllSearchCubit>().state;
    _onUpdateScroll(ScrollMetrics metrics, BuildContext context) {
      var height = (MediaQuery.of(context).size.height) - 130;
      if (metrics.extentAfter / height < 0.5) {
        context.read<AllSearchCubit>().loadMore();
      }
    }

    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
            color: Colors.deepPurpleAccent,
            child: NotificationListener(
              onNotification: (scrollNotification) {
                if (scrollNotification is ScrollUpdateNotification) {
                  _onUpdateScroll(scrollNotification.metrics, context);
                }
                return false;
              },
              child: ListView.builder(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  itemBuilder: (BuildContext context, int index) {
                    if (state is AllSearched) {
                      return ListItemView<User>(item: state.allList[index]);
                    } else if (state is AllSearchLoadMore) {
                      if (index > state.allList.length - 1) {
                        return ProgressBarBottom();
                      } else {
                        return ListItemView<User>(item: state.allList[index]);
                      }
                    } else {
                      return SizedBox();
                    }
                  },
                  itemCount: (state is AllSearched)
                      ? state.allList.length
                      : (state is AllSearchLoadMore)
                          ? state.allList.length + 1
                          : 0),
            )),
        Visibility(
          visible: (state is AllSearching),
          child: Container(
              margin: EdgeInsets.all(20),
              width: 20,
              height: 20,
              child: CircularProgressIndicator(strokeWidth: 3)),
        ),
        Visibility(
          visible: (state is AllSearchFail),
          child: Container(
              padding: EdgeInsets.all(8),
              color: Colors.orangeAccent,
              child:
                  Align(alignment: Alignment.topCenter, child: Text('Fail'))),
        ),
        Visibility(
          visible: (state is AllSearched && state.allList.length == 0),
          child: Container(
              padding: EdgeInsets.all(8),
              color: Colors.lightGreen,
              child: Align(
                  alignment: Alignment.topCenter, child: Text('no result'))),
        ),
      ],
    );
  }
}
