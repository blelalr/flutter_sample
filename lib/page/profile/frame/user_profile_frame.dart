import 'package:flutter/material.dart';
import 'package:flutter_sample/page/profile/user_name_view.dart';
import 'package:flutter_sample/page/profile/user_photo_view.dart';

import '../number_item_view.dart';

class UserProfileFrame extends StatelessWidget {
  const UserProfileFrame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isVerified = false;
    return Column(
      children: [
        ConstrainedBox(
            constraints: BoxConstraints(minHeight: 90),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  UserPhotoView(isVerified: isVerified),
                  UserNameView(),
                ],
              ),
            )),
        BuildNumberItems(numberItems: [
          NumberItemView(number: '112', title: 'Followers'),
          NumberItemView(number: '324', title: 'Following'),
          NumberItemView(number: '12', title: 'Videos')
        ])
      ],
    );
  }
}

class BuildNumberItems extends StatelessWidget {
  final List<Widget> numberItems;
  const BuildNumberItems({Key? key, required this.numberItems})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 24, left: 20, bottom: 24, right: 20),
      child: Row(children: numberItems),
    );
  }
}
