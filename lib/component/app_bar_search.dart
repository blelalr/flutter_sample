import 'package:flutter/material.dart';
import 'package:flutter_sample/bloc/search/search_cubit.dart';
import 'package:flutter_sample/bloc/theme/theme_cubit.dart';
import 'package:flutter_sample/component/common/icon_button_default.dart';
import 'package:flutter_sample/res/app_colors.dart';
import 'package:flutter_sample/res/app_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBarSearch extends StatefulWidget {
  const AppBarSearch({Key? key}) : super(key: key);

  @override
  _AppBarSearchState createState() => _AppBarSearchState();
}

class _AppBarSearchState extends State<AppBarSearch> {
  TextEditingController _searchQueryController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final themeCubit = context.watch<ThemeCubit>();
    final searchCubit = context.watch<SearchCubit>();
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 12),
      child: Row(
        children: [
          Visibility(
              visible: !searchCubit.isSearch,
              child: IconButtonDefault(
                  iconPath: 'assets/icon/arrow_left.svg',
                  press: () => Navigator.pop(context))),
          Visibility(
              visible: searchCubit.isSearch,
              child: SizedBox(
                width: 16,
              )),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 4, bottom: 4),
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: themeCubit.isDarkMode
                    ? AppColors.backgroundDark2nd
                    : AppColors.backgroundLight2nd,
              ),
              child: Row(
                children: [
                  IconButtonDefault(
                    iconPath: 'assets/icon/search_s.svg',
                    color: Theme.of(context).hintColor,
                  ),
                  Flexible(
                    child: TextField(
                      controller: _searchQueryController,
                      autofocus: searchCubit.isSearch,
                      decoration: InputDecoration(
                        isDense: true,
                        hintText: "Search",
                        border: InputBorder.none,
                        hintStyle: AppFonts.bodyText(
                            textColor: Theme.of(context).hintColor),
                      ),
                      style: AppFonts.bodyText(),
                      onChanged: (query) => updateSearchQuery(query),
                      onTap: _startSearch,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 8),
          Visibility(
              visible: searchCubit.isSearch,
              child: GestureDetector(
                child: Text(
                  'Cancel',
                  style:
                      AppFonts.button(textColor: Theme.of(context).hintColor),
                ),
                onTap: () => {_stopSearching()},
              )),
          SizedBox(width: 8),
        ],
      ),
    );
  }

  void _startSearch() {
    // ModalRoute.of(context)
    //     ?.addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));
    context.read<SearchCubit>().switchToSearchMode();
  }

  void updateSearchQuery(String query) {
    context.read<SearchCubit>().searchQuery(query);
  }

  void _stopSearching() {
    _clearSearchQuery();

    FocusScopeNode currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }

    context.read<SearchCubit>().switchToDiscoverMode();
  }

  void _clearSearchQuery() {
    setState(() {
      _searchQueryController.clear();
    });
  }
}
