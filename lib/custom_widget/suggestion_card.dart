import 'package:flutter/material.dart';
import 'package:flutter_sample/custom_widget/button_small_outlined.dart';
import 'package:flutter_sample/custom_widget/button_small.dart';
import 'package:flutter_sample/model/suggestion_model.dart';
import 'package:flutter_sample/style/app_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SuggestionCard extends StatelessWidget {
  final SuggestionModel suggestionModel;
  const SuggestionCard({Key? key, required this.suggestionModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ConstrainedBox(
        constraints: BoxConstraints(
            minHeight: 224, maxHeight: 224, minWidth: 156, maxWidth: 156),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12)),
                child: Image(
                  image: NetworkImage('${suggestionModel.imagePath}'),
                  width: 156,
                  height: 116,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 24,
                      ),
                      Container(
                        width: 156,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        padding: const EdgeInsets.fromLTRB(12, 32, 12, 12),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '${suggestionModel.nickName}',
                              style: AppFonts.button(
                                  textColor: Theme.of(context).iconTheme.color),
                            ),
                            Text('${suggestionModel.account}',
                                style: AppFonts.bodyText(
                                    textColor: Theme.of(context).hintColor)),
                            (suggestionModel.type == TYPE.normal ||
                                    suggestionModel.type == TYPE.hashTag)
                                ? (suggestionModel.isFollowing)
                                    ? ButtonSmallOutlined(
                                        width: 132,
                                        text: 'Following',
                                        press: () => {})
                                    : ButtonSmall(
                                        width: 132,
                                        text: 'Follow',
                                        press: () => {})
                                : ButtonSmall(
                                    width: 132,
                                    text: 'Learn More',
                                    backgroundColor:
                                        Theme.of(context).colorScheme.secondary,
                                    textColor: Theme.of(context)
                                        .colorScheme
                                        .onSecondary,
                                    press: () => {})
                          ],
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Theme.of(context).primaryColor,
                                    width: 2),
                                borderRadius: BorderRadius.circular(50.0),
                              )),
                          ClipOval(
                            child: SvgPicture.asset(
                              'assets/icon/no_photo.svg',
                              width: 48,
                              height: 48,
                            ),
                          ),
                        ],
                      ),
                      if (suggestionModel.type == TYPE.verify)
                        Image.asset(
                          'assets/pic/verified_f_profile.png',
                          width: 18,
                          height: 18,
                        )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
