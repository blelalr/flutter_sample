import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample/page/infinite/infinite_list_bloc/post_bloc.dart';
import 'package:flutter_sample/page/infinite/post.dart';

class InfiniteListBlocPage extends StatelessWidget {
  const InfiniteListBlocPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Infinite List Bloc'),
        ),
        body: BlocProvider(
            create: (_) => PostBloc()..add(PostFetched()),
            child: PostListView()));
  }
}

class PostListView extends StatefulWidget {
  const PostListView({Key? key}) : super(key: key);

  @override
  _PostListViewState createState() => _PostListViewState();

}

class _PostListViewState extends State<PostListView> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }
  
  @override
  Widget build(BuildContext context) {
    return BlocListView(scrollController: _scrollController);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<PostBloc>().add(PostFetched());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

}

class BottomLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 24,
        width: 24,
        child: CircularProgressIndicator(strokeWidth: 1.5),
      ),
    );
  }
}

class PostListItem extends StatelessWidget {
  const PostListItem({Key? key, required this.post}) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Material(
      child: ListTile(
        leading: Text('${post.id}', style: textTheme.caption),
        title: Text(post.title),
        isThreeLine: true,
        subtitle: Text(post.body),
        dense: true,
      ),
    );
  }
}

class BlocListView extends StatelessWidget {
  const BlocListView({Key? key, required this.scrollController}) : super(key: key);
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    var state = context.watch<PostBloc>().state;
    switch (state.status) {
      case PostStatus.failure:
        return const Center(child: Text('failed to fetch posts'));
      case PostStatus.success:
        if (state.posts.isEmpty) {
          return const Center(child: Text('no posts'));
        }
        return ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return index >= state.posts.length
                ? BottomLoader()
                : PostListItem(post: state.posts[index]);
          },
          itemCount: state.hasReachedMax
              ? state.posts.length
              : state.posts.length + 1,
          controller: scrollController,
        );
      default:
        return const Center(child: CircularProgressIndicator());
    }
  }
}
