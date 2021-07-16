import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample/model/user_data.dart';

class AllListItemView extends StatelessWidget {
  final User user;
  const AllListItemView({Key? key, required this.user}) : super(key: key);

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
