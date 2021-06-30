import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_sample/bloc/theme/theme_cubit.dart';
import 'package:flutter_sample/page/test_sample/button/button_smaill_outlined.dart';
import 'package:flutter_sample/page/test_sample/button/button_small.dart';
import 'package:flutter_sample/page/theme_sample/theme_switch_widget.dart';
import 'package:flutter_sample/style/app_colors.dart';
import 'package:flutter_sample/style/app_fonts.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeSample extends StatelessWidget {
  const ThemeSample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final iconColor = Theme.of(context).iconTheme.color;
    final primaryColor = Theme.of(context).primaryColor;
    final themeBloc = context.watch<ThemeCubit>();
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
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
                child: Column(
              children: [
                UpgradeCard(),
                UserProfileCard(),
                ProfileButtonStack(),
              ],
            )),
            SliverToBoxAdapter(
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 12,
                    color: primaryColor,
                  ),
                  Positioned(
                    right: 16,
                    child: SvgPicture.asset(
                      'assets/icon/popupArrow.svg',
                      width: 32,
                      height: 14,
                      color: themeBloc.isDarkMode
                          ? AppColors.backgroundDarkB1
                          : AppColors.backgroundLightB1,
                    ),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
                child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                color: themeBloc.isDarkMode
                    ? AppColors.backgroundDarkB1
                    : AppColors.backgroundLightB1,
                child: IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                          width: 150,
                          child: Card(
                            child: Container(
                              color: Theme.of(context).hintColor,
                            ),
                          )),
                      Container(
                          width: 150,
                          height: 150, //change height All element change
                          child: Card(
                            child: Container(
                              color: Theme.of(context).hintColor,
                            ),
                          )),
                      Container(
                          width: 150,
                          child: Card(
                            child: Container(
                              color: Theme.of(context).hintColor,
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            )),
            SliverToBoxAdapter(
              child: Container(
                height: 200.0,
                color: themeBloc.isDarkMode
                    ? AppColors.backgroundDarkB1
                    : AppColors.backgroundLightB1,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                        width: 150.0,
                        height: 90,
                        child: Card(
                          child: Container(
                            color: Theme.of(context).hintColor,
                          ),
                        ));
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(height: 200, color: Colors.green),
                  Container(height: 200, color: Colors.pink),
                  Container(height: 200, color: Colors.green),
                  Container(height: 200, color: Colors.pink),
                ],
              ),
            ),
          ],
        ));
  }
}

class UpgradeCard extends StatelessWidget {
  const UpgradeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final iconColor = Theme.of(context).iconTheme.color;
    final hintColor = Theme.of(context).hintColor;

    return Container(
        width: double.infinity,
        padding: EdgeInsets.only(bottom: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                width: double.infinity, height: 0.5, color: AppColors.line83),
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
              padding:
                  const EdgeInsets.only(left: 32, right: 32, top: 8, bottom: 8),
              child: Text(
                'Grow your profile and unlock features such as customizable contact buttons, insights, verification badges and more.',
                style: AppFonts.caption(textColor: hintColor),
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
                width: double.infinity, height: 1, color: AppColors.line83),
            SizedBox(
              height: 8,
            ),
          ],
        ));
  }

  closeClick() {
    print('Click');
  }
}

class UserProfileCard extends StatelessWidget {
  const UserProfileCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isVerified = false;
    final iconColor = Theme.of(context).iconTheme.color;
    final hintColor = Theme.of(context).hintColor;
    return Column(
      children: [
        ConstrainedBox(
            constraints: BoxConstraints(minHeight: 90),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Stack(children: [
                        Container(
                          margin:
                              EdgeInsets.only(left: 16, right: 16, bottom: 4),
                          child: ClipOval(
                            child: SvgPicture.asset(
                              'assets/icon/no_photo.svg',
                              width: 96,
                              height: 96,
                            ),
                          ),
                        ),
                        isVerified ? verifiedIcon() : noPhotoCamera(),
                      ]),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'NickName', //jrkgjworjgiowegowjeogiwejgojwegojweogjwoegjowejgowejgoiwejgowjeoigwjeog',
                              style: AppFonts.bigTitle(textColor: iconColor),
                              textAlign: TextAlign.start,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset('assets/icon/lock_f.svg',
                                    color: hintColor, width: 18, height: 18),
                                Expanded(
                                  child: Text(
                                    'uid3625174215436', //7584efiojweiofjioewjfojewoifjowejfiowjeofjweiofjowejfiowejiof',
                                    style:
                                        AppFonts.button(textColor: hintColor),
                                    textAlign: TextAlign.start,
                                  ),
                                )
                              ],
                            )
                          ]),
                    ),
                  )
                ],
              ),
            )),
        Container(
          margin: EdgeInsets.only(top: 24, left: 20, bottom: 24, right: 20),
          child: Row(
            children: [
              numberItem('112', 'Followers', iconColor),
              numberItem('324', 'Following', iconColor),
              numberItem('12', 'Videos', iconColor),
            ],
          ),
        )
      ],
    );
  }

  noPhotoCamera() => Positioned(
      left: 82 + 16 - 18,
      top: 82 - 18,
      child: Image.asset(
        'assets/pic/icon_with_o_small.png',
        width: 36,
        height: 36,
      ));

  verifiedIcon() => Positioned(
      left: 82 + 16 - 14,
      top: 82 - 14,
      child: Image.asset(
        'assets/pic/verified_f_profile.png',
        width: 28,
        height: 28,
      ));

  numberItem(String number, String title, Color? iconColor) => Flexible(
        child: Center(
          child: Column(
            children: [
              Container(
                  child: Text('$number',
                      style: AppFonts.subTitle(textColor: iconColor))),
              Container(
                  child: Text('$title',
                      style: AppFonts.caption(textColor: iconColor))),
            ],
          ),
        ),
      );
}

class ProfileButtonStack extends StatelessWidget {
  const ProfileButtonStack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final iconColor = Theme.of(context).iconTheme.color;
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Column(children: [
        Row(
          children: [
            Flexible(
                child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: ButtonSmall(
                width: double.infinity,
                text: 'Type Something',
                press: () => {},
              ),
            )),
            Flexible(
                child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: ButtonSmallOutlined(
                  width: double.infinity,
                  text: 'Type Something',
                  press: () => {}),
            )),
            ButtonSmallOutlined(
                icon: SvgPicture.asset('assets/icon/arrow_left.svg',
                    color: iconColor),
                press: () => {})
          ],
        ),
        Row(
          children: [
            Flexible(
                child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: ButtonSmallOutlined(
                  width: double.infinity,
                  text: 'Type Something',
                  press: () => {}),
            )),
            ButtonSmallOutlined(
                icon: SvgPicture.asset('assets/icon/arrow_left.svg',
                    color: iconColor),
                press: () => {})
          ],
        ),
        Row(
          children: [
            Flexible(
                child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: ButtonSmall(
                width: double.infinity,
                text: 'Type Something',
                press: () => {},
              ),
            )),
            Flexible(
                child: Padding(
              padding: const EdgeInsets.only(right: 0),
              child: ButtonSmallOutlined(
                  width: double.infinity,
                  text: 'Type Something',
                  press: () => {}),
            )),
          ],
        ),
        Row(
          children: [
            Flexible(
                child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: ButtonSmallOutlined(
                  width: double.infinity,
                  text: 'Type Something',
                  press: () => {}),
            )),
            Flexible(
                child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: ButtonSmallOutlined(
                  width: double.infinity,
                  text: 'Type Something',
                  press: () => {}),
            )),
            Flexible(
                child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: ButtonSmallOutlined(
                  width: double.infinity,
                  text: 'Type Something',
                  press: () => {}),
            )),
            ButtonSmallOutlined(
                icon: SvgPicture.asset('assets/icon/arrow_left.svg',
                    color: iconColor),
                press: () => {})
          ],
        ),
      ]),
    );
  }
}
