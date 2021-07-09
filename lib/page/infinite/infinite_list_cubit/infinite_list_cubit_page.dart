import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample/component/bottom_loader.dart';
import 'package:flutter_sample/page/infinite/infinite_list_cubit/post_cubit.dart';
import 'package:flutter_sample/model/post.dart';

class InfiniteListCubitPage extends StatelessWidget {
  const InfiniteListCubitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Infinite List Cubit')),
      body: BlocProvider<PostCubit>(
        create: (context) => PostCubit()..fetchPost(),
        child: PostListView(),
      ),
    );
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
    return Container(
      child: BlocBuilder<PostCubit, PostState>(
        builder: (context, state) {
          if (state is PostLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PostSuccess) {
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return index >= state.posts.length && !state.isReachMax
                    ? BottomLoader()
                    : PostListItem(post: state.posts[index]);
              },
              itemCount: state.isReachMax
                  ? state.posts.length
                  : state.posts.length + 1,
              controller: _scrollController,
            );
          } else {
            return Center(child: Text('failed to fetch posts'));
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<PostCubit>().fetchPost();
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
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
        title: Text('${post.title}'),
        isThreeLine: true,
        subtitle: Text('${post.body}'),
        dense: true,
      ),
    );
  }
}
