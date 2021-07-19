import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample/model/repo_data.dart';
import 'package:flutter_sample/model/user_data.dart';

class ListItemView<T> extends StatelessWidget {
  final T item;
  const ListItemView({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListTile(
        leading: ClipOval(child: getLeading(item)),
        title: getTitle(item),
        subtitle: getSubTitle(item),
        dense: true,
      ),
    );
  }

  Widget getLeading(T item) {
    //user
    if (item is User) {
      return Image.network(
        '${item.avatarUrl}',
        width: 50,
        height: 50,
        fit: BoxFit.cover,
      );
      //repo
    } else {
      return Image.network(
        '${(item as Repo).owner.avatarUrl}',
        width: 50,
        height: 50,
        fit: BoxFit.cover,
      );
    }
  }

  Widget getTitle(T item) {
    //user
    if (item is User) {
      return Text('${item.login}');
      //repo
    } else {
      return Text('${(item as Repo).id}');
    }
  }

  Widget getSubTitle(T item) {
    //user
    if (item is User) {
      return Text('${item.id}');
      //repo
    } else {
      return Text('${(item as Repo).nodeId}');
    }
  }
}
