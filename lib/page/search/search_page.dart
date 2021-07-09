import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample/bloc/photo/photo_cubit.dart';
import 'package:flutter_sample/component/bottom_loader.dart';
import 'package:flutter_sample/model/photo.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<PhotoCubit>().fetchPhoto();
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhotoCubit, PhotoState>(
      builder: (context, state) {
        if (state is PhotoLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is PhotoLoaded) {
          return StaggeredGridView.countBuilder(
            shrinkWrap: true,
            crossAxisCount: 6,
            crossAxisSpacing: 1,
            mainAxisSpacing: 1,
            controller: _scrollController,
            itemCount: state.isReachMax
                ? state.photos.length
                : state.photos.length + 1,
            itemBuilder: (context, index) {
              return index >= state.photos.length && !state.isReachMax
                  ? BottomLoader()
                  : PhotoItem(photo: state.photos[index]);
            },
            staggeredTileBuilder: (index) => StaggeredTile.count(
                (index % 12 == 7) || (index % 12 == 0) ? 4 : 2,
                (index % 12 == 7) || (index % 12 == 0) ? 6 : 3),
          );
        } else {
          return Container();
        }
      },
    );
  }
}

class PhotoItem extends StatelessWidget {
  final Photo photo;
  const PhotoItem({Key? key, required this.photo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Image.network(
      '${photo.thumbnailUrl}',
      fit: BoxFit.cover,
    ));
  }
}
