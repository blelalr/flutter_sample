import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_sample/bloc/complete_profile/profile_task_cubit.dart';
import 'package:flutter_sample/bloc/theme/theme_cubit.dart';
import 'package:flutter_sample/custom_widget/button_small_outlined.dart';
import 'package:flutter_sample/custom_widget/button_small.dart';
import 'package:flutter_sample/custom_widget/suggestion_card.dart';
import 'package:flutter_sample/custom_widget/icon_button_default.dart';
import 'package:flutter_sample/custom_widget/switch_theme_widget.dart';
import 'package:flutter_sample/custom_widget/text_see_more.dart';
import 'package:flutter_sample/model/profile_task_model.dart';
import 'package:flutter_sample/model/suggestion_model.dart';
import 'package:flutter_sample/style/app_colors.dart';
import 'package:flutter_sample/style/app_fonts.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class ThemeSample extends StatelessWidget {
  const ThemeSample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var list = <SuggestionModel>[
      SuggestionModel(
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRC9KgKZzL7dABScRnlAMu2Xc9cIgaEzrCRXJvNuXlBHwlZQ7zP9Ae2SIZDUEcZnrfMb8s&usqp=CAU',
          'nickName',
          'account',
          TYPE.normal,
          false),
      SuggestionModel(
          'https://www.liveabout.com/thmb/pVU4LPH5swXApRrz2hvskfWdTHE=/640x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/sp809_Something_Wall-Mart_This_Way_Comes_1-56a00a4f5f9b58eba4ae9a93.jpg',
          'nickName',
          'account',
          TYPE.normal,
          true),
      SuggestionModel(
          'https://www.liveabout.com/thmb/KPu6o0bmkKq2oGH9brQWolIf7IE=/479x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/tomandjerry-56a00b943df78cafda9fcac4.jpg',
          'nickName',
          'account',
          TYPE.verify,
          false),
      SuggestionModel(
          'https://www.liveabout.com/thmb/3mCctbAuSJsL1a9H2SzPDiYm0O8=/1367x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/powerpuff_girls-56a00bc45f9b58eba4aea61d.jpg',
          '#Dog',
          '1.2k Posts',
          TYPE.hashTag,
          true),
      SuggestionModel(
          'https://www.liveabout.com/thmb/9C-lNYu_kohW6x4393PbYOG_dYQ=/1200x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/dexters_laboratory-56a010303df78cafda9fdf8b.jpg',
          '#Cat',
          '6k Posts',
          TYPE.hashTag,
          false),
    ];
    return Scaffold(
        appBar: AppBar(
          leading: IconButtonDefault(
              iconPath: 'assets/icon/arrow_left.svg',
              press: () => Navigator.pop(context)),
          elevation: 1,
          actions: [
            SwitchThemeWidget(),
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
              SuggestionFrame(suggestionList: list),
              DescriptionFrame(),
              ProfileTaskFrame(),
            ])),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(height: 100, color: Theme.of(context).primaryColor),
                ],
              ),
            ),
          ],
        ));
  }
}

class TopFrame extends StatelessWidget {
  const TopFrame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.only(bottom: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                width: double.infinity, height: 0.5, color: AppColors.line83),
            SizedBox(height: 8),
            TopFrameStackView(),
            Padding(
              padding:
                  const EdgeInsets.only(left: 32, right: 32, top: 8, bottom: 8),
              child: Text(
                'Grow your profile and unlock features such as customizable contact buttons, insights, verification badges and more.',
                style: AppFonts.caption(textColor: Theme.of(context).hintColor),
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
                  UserProfileFramePhotoView(isVerified: isVerified),
                  UserProfileFrameNameView(),
                ],
              ),
            )),
        BuildNumberItems(numberItems: [
          NumberItem(number: '112', title: 'Followers'),
          NumberItem(number: '324', title: 'Following'),
          NumberItem(number: '12', title: 'Videos')
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

class NumberItem extends StatelessWidget {
  final String number;
  final String title;
  const NumberItem({Key? key, required this.number, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Center(
        child: Column(
          children: [
            Container(child: Text('$number', style: AppFonts.subTitle())),
            Container(child: Text('$title', style: AppFonts.caption())),
          ],
        ),
      ),
    );
  }
}

class UserProfileFramePhotoView extends StatelessWidget {
  final isVerified;

  const UserProfileFramePhotoView({Key? key, this.isVerified})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Align(
        alignment: Alignment.topCenter,
        child: Stack(children: [
          Container(
            margin: EdgeInsets.only(left: 16, right: 16, bottom: 4),
            child: ClipOval(
              child: SvgPicture.asset(
                'assets/icon/no_photo.svg',
                width: 96,
                height: 96,
              ),
            ),
          ),
          isVerified ? VerifiedIcon() : NoPhotoIcon(),
        ]),
      ),
    );
  }
}

class VerifiedIcon extends StatelessWidget {
  const VerifiedIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: 82 + 16 - 14,
        top: 82 - 14,
        child: Image.asset(
          'assets/pic/verified_f_profile.png',
          width: 28,
          height: 28,
        ));
  }
}

class NoPhotoIcon extends StatelessWidget {
  const NoPhotoIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: 82 + 16 - 18,
        top: 82 - 18,
        child: Image.asset(
          'assets/pic/icon_with_o_small.png',
          width: 36,
          height: 36,
        ));
  }
}

class UserProfileFrameNameView extends StatelessWidget {
  const UserProfileFrameNameView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'NickName', //jrkgjworjgiowegowjeogiwejgojwegojweogjwoegjowejgowejgoiwejgowjeoigwjeog',
                style: AppFonts.bigTitle(),
                textAlign: TextAlign.start,
              ),
              UidIconText()
            ]),
      ),
    );
  }
}

class UidIconText extends StatelessWidget {
  const UidIconText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset('assets/icon/lock_f.svg',
            color: Theme.of(context).hintColor, width: 18, height: 18),
        Expanded(
          child: Text(
            'uid3625174215436', //7584efiojweiofjioewjfojewoifjowejfiowjeofjweiofjowejfiowejiof',
            style: AppFonts.button(textColor: Theme.of(context).hintColor),
            textAlign: TextAlign.start,
          ),
        )
      ],
    );
  }
}

class ButtonStackFrame extends StatelessWidget {
  const ButtonStackFrame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Column(children: [
        BuildButtonRow(buttons: [
          ButtonStackFrameNormalButton(),
          ButtonStackFrameOutLinedButton(),
          ButtonSmallOutlined(
              icon: SvgPicture.asset('assets/icon/arrow_left.svg'),
              press: () => {})
        ]),
        BuildButtonRow(buttons: [
          ButtonStackFrameOutLinedButton(),
          ButtonSmallOutlined(
              icon: SvgPicture.asset('assets/icon/arrow_left.svg'),
              press: () => {})
        ]),
        BuildButtonRow(buttons: [
          ButtonStackFrameNormalButton(),
          ButtonStackFrameOutLinedButton(),
        ]),
        BuildButtonRow(buttons: [
          ButtonStackFrameOutLinedButton(),
          ButtonStackFrameOutLinedButton(),
          ButtonStackFrameOutLinedButton(),
          ButtonSmallOutlined(
              icon: SvgPicture.asset('assets/icon/arrow_left.svg'),
              press: () => {})
        ]),
      ]),
    );
  }
}

class BuildButtonRow extends StatelessWidget {
  final List<Widget> buttons;
  const BuildButtonRow({Key? key, required this.buttons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: buttons,
    );
  }
}

class ButtonStackFrameOutLinedButton extends StatelessWidget {
  const ButtonStackFrameOutLinedButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ButtonSmallOutlined(
          width: double.infinity, text: 'Type Something', press: () => {}),
    ));
  }
}

class ButtonStackFrameNormalButton extends StatelessWidget {
  const ButtonStackFrameNormalButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ButtonSmall(
        width: double.infinity,
        text: 'Type Something',
        press: () => {},
      ),
    ));
  }
}

class SuggestionFrame extends StatelessWidget {
  final List<SuggestionModel> suggestionList;
  const SuggestionFrame({Key? key, required this.suggestionList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeBloc = context.watch<ThemeCubit>();
    return Column(children: [
      Stack(
        children: [
          Container(
            width: double.infinity,
            height: 12,
            color: Theme.of(context).primaryColor,
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
      Container(
          padding: EdgeInsets.only(top: 12, left: 16, right: 16),
          width: double.infinity,
          color: themeBloc.isDarkMode
              ? AppColors.backgroundDarkB1
              : AppColors.backgroundLightB1,
          child: Text(
            'Suggested for You',
            style: AppFonts.button(textColor: Theme.of(context).hintColor),
          )),
      Container(
        height: 252,
        color: themeBloc.isDarkMode
            ? AppColors.backgroundDarkB1
            : AppColors.backgroundLightB1,
        child: ListView.builder(
          padding: EdgeInsets.all(10),
          scrollDirection: Axis.horizontal,
          itemCount: suggestionList.length,
          itemBuilder: (context, index) {
            return SuggestionCard(suggestionModel: suggestionList[index]);
          },
        ),
      ),
    ]);
  }
}

class DescriptionFrame extends StatelessWidget {
  const DescriptionFrame({Key? key}) : super(key: key);

  void openWebsiteByUrl(String urlString) async {
    await canLaunch(urlString)
        ? await launch(urlString)
        : debugPrint('Could not launch $urlString');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextSeeMore(
            'Wiki engines usually allow content to be written using a simplified markup language and sometimes edited with the help of a rich-text editor. There are dozens of different wiki engines in use, both standalone and part of other software, such as bug tracking systems.\nSome wiki engines are open source, whereas others are proprietary. Some permit control over different functions (levels of access); for example, editing rights may permit changing, adding, or removing material.',
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text.rich(TextSpan(children: [
              TextSpan(
                  text: "https://www.google.com",
                  style: TextStyle(color: Colors.blue),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => openWebsiteByUrl("https://www.google.com")),
            ])),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text.rich(TextSpan(children: [
              TextSpan(
                  text: "Followed by ",
                  style:
                      AppFonts.caption(textColor: Theme.of(context).hintColor)),
              TextSpan(text: "Vicky, Helenli, ", style: AppFonts.caption()),
              TextSpan(
                  text: "and ",
                  style:
                      AppFonts.caption(textColor: Theme.of(context).hintColor)),
              TextSpan(text: "Popo ", style: AppFonts.caption()),
            ])),
          ),
        ],
      ),
    );
  }
}

class ProfileTaskFrame extends StatelessWidget {
  const ProfileTaskFrame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileTaskCubit>(
        create: (context) => ProfileTaskCubit()..fetchProfileTask(),
        child: BuildProfileTaskView());
  }
}

class ProfileTaskItem extends StatelessWidget {
  final ProfileTaskModel profileTaskModel;
  const ProfileTaskItem(this.profileTaskModel, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            constraints: BoxConstraints(minHeight: 136),
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: context.watch<ThemeCubit>().isDarkMode
                  ? AppColors.BackgroundElevatedDark1st
                  : AppColors.BackgroundElevatedLight1st,
              border: Border.all(
                color: context.watch<ThemeCubit>().isDarkMode
                    ? AppColors.innerBorderDark
                    : AppColors.innerBorderLight,
                width: 1,
              ),
            ),
            width: 220,
            child: Padding(
              padding: const EdgeInsets.only(left: 12, top: 15, right: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset('${profileTaskModel.iconPath}',
                          width: 20,
                          height: 20,
                          color: Theme.of(context).iconTheme.color),
                      Flexible(
                        child: Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            '${profileTaskModel.title}',
                            style: AppFonts.button(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Flexible(
                    child: Container(
                      margin: EdgeInsets.only(top: 10, bottom: 12),
                      width: double.infinity,
                      height: double.infinity,
                      child: Text(
                        '${profileTaskModel.content}',
                        style: AppFonts.caption(
                            textColor: Theme.of(context).hintColor),
                      ),
                    ),
                  ),
                  Container(
                      width: double.infinity,
                      height: 0.5,
                      color: AppColors.line83),
                  Container(
                    padding: EdgeInsets.only(top: 15, bottom: 15),
                    width: double.infinity,
                    child: Text(
                      '${profileTaskModel.buttonText}',
                      textAlign: TextAlign.center,
                      style: AppFonts.button(
                          textColor: Theme.of(context).colorScheme.primary),
                    ),
                  )
                ],
              ),
            )),
        Positioned(
            top: 0,
            right: 0,
            child: GestureDetector(
              onTap: () => {
                context
                    .read<ProfileTaskCubit>()
                    .deleteProfileTask(profileTaskModel)
              },
              child: SvgPicture.asset('assets/icon/icon_colse.svg',
                  color: Theme.of(context).hintColor, width: 20, height: 20),
            ))
      ],
    );
  }
}

class BuildProfileTaskView extends StatelessWidget {
  // final List<Widget> widgets;
  const BuildProfileTaskView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: EdgeInsets.all(8),
        scrollDirection: Axis.horizontal,
        child: IntrinsicHeight(
          child: BlocBuilder<ProfileTaskCubit, ProfileTaskState>(
            builder: (context, state) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: List.generate(
                    updateProfileTask(state).length,
                    (index) =>
                        ProfileTaskItem(updateProfileTask(state)[index])),
              );
            },
          ),
        ));
  }

  List<ProfileTaskModel> updateProfileTask(ProfileTaskState state) {
    if (state is ProfileTaskUpdate) {
      return state.profileTasks;
    } else {
      return [];
    }
  }
}
