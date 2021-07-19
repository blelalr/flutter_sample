import 'package:flutter/material.dart';
import 'package:flutter_sample/bloc/theme/theme_cubit.dart';
import 'package:flutter_sample/component/card_suggestion.dart';
import 'package:flutter_sample/model/suggestion.dart';
import 'package:flutter_sample/res/app_colors.dart';
import 'package:flutter_sample/res/app_fonts.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuggestionFrame extends StatelessWidget {
  const SuggestionFrame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var list = <Suggestion>[
      Suggestion(
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRC9KgKZzL7dABScRnlAMu2Xc9cIgaEzrCRXJvNuXlBHwlZQ7zP9Ae2SIZDUEcZnrfMb8s&usqp=CAU',
          'nickName',
          'account',
          TYPE.normal,
          false),
      Suggestion(
          'https://www.liveabout.com/thmb/pVU4LPH5swXApRrz2hvskfWdTHE=/640x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/sp809_Something_Wall-Mart_This_Way_Comes_1-56a00a4f5f9b58eba4ae9a93.jpg',
          'nickName',
          'account',
          TYPE.normal,
          true),
      Suggestion(
          'https://www.liveabout.com/thmb/KPu6o0bmkKq2oGH9brQWolIf7IE=/479x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/tomandjerry-56a00b943df78cafda9fcac4.jpg',
          'nickName',
          'account',
          TYPE.verify,
          false),
      Suggestion(
          'https://www.liveabout.com/thmb/3mCctbAuSJsL1a9H2SzPDiYm0O8=/1367x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/powerpuff_girls-56a00bc45f9b58eba4aea61d.jpg',
          '#Dog',
          '1.2k Posts',
          TYPE.hashTag,
          true),
      Suggestion(
          'https://www.liveabout.com/thmb/9C-lNYu_kohW6x4393PbYOG_dYQ=/1200x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/dexters_laboratory-56a010303df78cafda9fdf8b.jpg',
          '#Cat',
          '6k Posts',
          TYPE.hashTag,
          false),
    ];
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
          itemCount: list.length,
          itemBuilder: (context, index) {
            return CardSuggestion(suggestionModel: list[index]);
          },
        ),
      ),
    ]);
  }
}
