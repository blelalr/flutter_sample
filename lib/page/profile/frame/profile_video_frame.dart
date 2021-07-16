import 'package:flutter/material.dart';
import 'package:flutter_sample/res/app_fonts.dart';

class ProfileVideosFrame extends StatelessWidget {
  const ProfileVideosFrame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverGrid.extent(
        childAspectRatio: 2 / 3, //w:h,
        maxCrossAxisExtent: 188,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
        children: getVideoData().map((item) => VideoItem(item: item)).toList());
  }
}

List<String> getVideoData() {
  return [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
  ];
}

class VideoItem extends StatelessWidget {
  final String item;

  const VideoItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: Center(
          child: Text(
        '$item',
        style: AppFonts.subTitle(),
      )),
    );
  }
}
