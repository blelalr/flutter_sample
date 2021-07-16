import 'package:flutter/material.dart';
import 'package:flutter_sample/component/icon_button_default.dart';
import 'package:flutter_sample/res/app_fonts.dart';

class TopFrameStackView extends StatelessWidget {
  const TopFrameStackView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: double.infinity,
          child: Image.asset(
            'assets/pic/upgrade_to_official_account_p01.png',
            width: 144,
            height: 144,
          ),
        ),
        Text('Upgrade to a Free Official Account', style: AppFonts.button()),
        Positioned(
            right: 0,
            top: 0,
            child: IconButtonDefault(
                iconPath: 'assets/icon/close.svg',
                color: Theme.of(context).hintColor))
      ],
    );
  }
}
