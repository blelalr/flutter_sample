import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_sample/component/icon_button_default.dart';
import 'package:flutter_sample/component/toggle_theme.dart';
import 'package:flutter_sample/page/profile/frame/top_frame.dart';
import 'package:flutter_sample/page/profile/frame/user_profile_frame.dart';

import 'frame/button_stack_frame.dart';
import 'frame/description_frame.dart';
import 'frame/profile_task_frame.dart';
import 'frame/profile_video_frame.dart';
import 'frame/sort_frame.dart';
import 'frame/suggestion_frame.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButtonDefault(
              iconPath: 'assets/icon/arrow_left.svg',
              press: () => Navigator.pop(context)),
          elevation: 1,
          actions: [
            ToggleTheme(),
            IconButtonDefault(iconPath: 'assets/icon/notification_s.svg'),
            IconButtonDefault(iconPath: 'assets/icon/menu.svg')
          ],
        ),
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverList(
                delegate: SliverChildListDelegate([
              TopFrame(),
              UserProfileFrame(),
              ButtonStackFrame(),
              SuggestionFrame(),
              DescriptionFrame(),
              ProfileTaskFrame(),
            ])),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(height: 16, color: Theme.of(context).primaryColor),
                ],
              ),
            ),
            SliverToBoxAdapter(child: SortFrame()),
            ProfileVideosFrame()
          ],
        ));
  }
}
