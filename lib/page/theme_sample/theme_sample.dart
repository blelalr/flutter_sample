import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_sample/page/test_sample/button/button_small.dart';
import 'package:flutter_sample/page/theme_sample/theme_switch_widget.dart';
import 'package:flutter_sample/style/app_colors.dart';
import 'package:flutter_sample/style/app_fonts.dart';
import 'package:flutter_svg/svg.dart';

class ThemeSample extends StatelessWidget {
  const ThemeSample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final iconColor = Theme.of(context).iconTheme.color;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            iconSize: 24,
            icon: SvgPicture.asset('assets/icon/arrow_left.svg',
                color: iconColor),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          elevation: 1,
          actions: [
            ThemeSwitchWidget(),
            IconButton(
              iconSize: 24,
              icon: SvgPicture.asset('assets/icon/notification_s.svg',
                  color: iconColor),
              onPressed: () {},
            ),
            IconButton(
              iconSize: 24,
              icon: SvgPicture.asset('assets/icon/menu.svg', color: iconColor),
              onPressed: () {},
            ),
          ],
        ),
        body: Container(
            width: double.infinity,
            padding: EdgeInsets.only(bottom: 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                    width: double.infinity,
                    height: 0.5,
                    color: AppColors.line83),
                SizedBox(height: 8),
                Stack(
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
                    Text('Upgrade to a Free Official Account',
                        style: AppFonts.button(textColor: iconColor)),
                    Positioned(
                        right: 0,
                        top: 0,
                        child: IconButton(
                          iconSize: 24,
                          icon: SvgPicture.asset('assets/icon/close.svg',
                              color: iconColor),
                          onPressed: () => closeClick(),
                        ))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 32, right: 32, top: 8, bottom: 8),
                  child: Text(
                    'Grow your profile and unlock features such as customizable contact buttons, insights, verification badges and more.',
                    style: AppFonts.caption(
                        textColor: Theme.of(context).hintColor),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 32, right: 32),
                  child: ButtonSmall(
                      width: double.infinity,
                      text: 'Upgrade now!',
                      press: () => {}),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                    width: double.infinity, height: 1, color: AppColors.line83)
              ],
            )));
  }

  closeClick() {
    print('Click');
  }
}
