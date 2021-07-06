import 'package:flutter/material.dart';
import 'package:flutter_sample/bloc/global_page_view/global_page_view_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample/page/infinite/post.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class GlobalPageView extends StatefulWidget {
  @override
  _GlobalPageViewState createState() => new _GlobalPageViewState();
}

class _GlobalPageViewState extends State<GlobalPageView> {
  int currentPage = 0;
  final PageController controller = PageController(
    initialPage: 0,
    keepPage: false,
    viewportFraction: 0.2,
  );

  @override
  initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 20), () {
      setState(() {
        controller.animateToPage(2,
            duration: Duration(milliseconds: 1), curve: Curves.bounceIn);
      });
    });
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int _itemCount = 5;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: 65,
          child: BlocConsumer<GlobalPageViewCubit, GlobalPageViewState>(
            listener: (context, state) {
              if (state is GlobalPageViewLoaded) {
                _itemCount = state.globalList.length;
              } else if (state is GlobalPageViewLoadMore) {
                _itemCount = state.fakeLoadingList.length;
              } else if (state is GlobalPageViewLoaded) {
                // _currentPosition =
              }
            },
            builder: (context, state) {
              return PageView.builder(
                  onPageChanged: (value) {
                    if (value == 0) {
                      context.read<GlobalPageViewCubit>().loadMoreLeft();
                      controller.animateToPage(2,
                          duration: Duration(milliseconds: 1),
                          curve: Curves.bounceIn);
                    } else if (value == _itemCount - 1) {
                      context.read<GlobalPageViewCubit>().loadMoreRight();
                      controller.animateToPage(_itemCount - 1,
                          duration: Duration(milliseconds: 1),
                          curve: Curves.bounceIn);
                    }
                  },
                  controller: controller,
                  itemCount: _itemCount,
                  itemBuilder: (context, index) => builder(index, state));
            },
          ),
        ),
        Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 2),
              borderRadius: BorderRadius.circular(50.0),
            )),
      ],
    );
  }

  builder(int index, GlobalPageViewState state) {
    return AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          double value = 1.0;
          if (controller.position.haveDimensions) {
            value = (controller.page ?? 0) - index;
            value = (1 - (value.abs() * 0.25)).clamp(0.5, 1);
          }
          return Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: Curves.easeOut.transform(value) * 64,
                width: Curves.easeOut.transform(value) * 64,
                child: Card(
                    elevation: 2,
                    clipBehavior: Clip.antiAlias,
                    shape: CircleBorder(
                        side:
                            BorderSide(color: Colors.grey.shade200, width: 2)),
                    child: loadByState(state, index)),
              ));
        });
  }

  Widget loadByState(GlobalPageViewState state, int index) {
    if (state is GlobalPageViewLoading) {
      return Shimmer(
        duration: Duration(milliseconds: 1500),
        enabled: true,
        child: Container(color: Colors.black45),
      );
    } else if (state is GlobalPageViewLoadMore) {
      List<Post> fakeList = state.fakeLoadingList;
      return Shimmer(
        duration: Duration(milliseconds: 1500),
        enabled: (fakeList[index].id == -1),
        child: (fakeList[index].id == -1)
            ? Container(color: Colors.black45)
            : Container(
                color: Colors.primaries[index % 17],
                child: Center(child: Text('${fakeList[index].id}'))),
      );
    } else if (state is GlobalPageViewLoaded) {
      List<Post> list = state.globalList;
      return Container(
          color: Colors.primaries[index % 17],
          child: Center(child: Text('${list[index].id}')));
    } else {
      return Container(color: Colors.black45);
    }
  }
}
