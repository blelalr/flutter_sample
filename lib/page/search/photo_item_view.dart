import 'package:flutter/material.dart';
import 'package:flutter_sample/model/photo.dart';

class PhotoItemView extends StatelessWidget {
  final Photo? photo;
  const PhotoItemView({Key? key, this.photo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Image.network(
      '${photo?.thumbnailUrl}',
      fit: BoxFit.cover,
    ));
  }
}
