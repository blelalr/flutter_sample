import 'package:flutter/material.dart';
import 'package:flutter_sample/model/repo_data.dart';

class LocationListItemView extends StatelessWidget {
  final Repo repo;
  const LocationListItemView({Key? key, required this.repo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListTile(
        leading: ClipOval(
          child: Image.network(
            '${repo.owner.avatarUrl}',
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
        ),
        title: Text('${repo.id}'),
        subtitle: Text('${repo.nodeId}'),
        dense: true,
      ),
    );
  }
}
