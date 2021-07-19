import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_sample/bloc/search/location_search_cubit.dart';
import 'package:flutter_sample/bloc/search/search_bar_cubit.dart';
import 'package:flutter_sample/bloc/search/all_search_cubit.dart';
import 'package:flutter_sample/bloc/theme/theme_cubit.dart';
import 'package:flutter_sample/component/icon_button_default.dart';
import 'package:flutter_sample/res/app_colors.dart';
import 'package:flutter_sample/res/app_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController _searchQueryController = TextEditingController();
  Timer? _debounce;
  String lastQuery = "";
  @override
  void initState() {
    _searchQueryController.addListener(_onSearchChanged);
    super.initState();
  }

  @override
  void dispose() {
    _searchQueryController.removeListener(_onSearchChanged);
    _searchQueryController.dispose();
    super.dispose();
  }

  _onSearchChanged() {
    if (lastQuery != _searchQueryController.text) {
      context.read<SearchBarCubit>().emit(SearchQueryIsChange());
      lastQuery = _searchQueryController.text;
      if (_debounce?.isActive ?? false) _debounce!.cancel();
      _debounce = Timer(Duration(milliseconds: 500), () {
        if (_searchQueryController.text != "") {
          context
              .read<AllSearchCubit>()
              .searchQuery(_searchQueryController.text);
          context
              .read<LocationSearchCubit>()
              .searchQuery(_searchQueryController.text);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeCubit = context.watch<ThemeCubit>();
    final searchBarCubit = context.watch<SearchBarCubit>();
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 12),
      child: Row(
        children: [
          Visibility(
              visible: !searchBarCubit.isSearchMode,
              child: IconButtonDefault(
                  iconPath: 'assets/icon/arrow_left.svg',
                  press: () => Navigator.pop(context))),
          Visibility(
              visible: searchBarCubit.isSearchMode,
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
                      autofocus: searchBarCubit.isSearchMode,
                      decoration: InputDecoration(
                        isDense: true,
                        hintText: "Search",
                        border: InputBorder.none,
                        hintStyle: AppFonts.bodyText(
                            textColor: Theme.of(context).hintColor),
                      ),
                      style: AppFonts.bodyText(),
                      onTap: _startSearch,
                    ),
                  ),
                  Visibility(
                    visible: (searchBarCubit.state is SearchQueryIsChange),
                    child: IconButtonDefault(
                      iconPath: 'assets/icon/icon_close.svg',
                      color: Theme.of(context).hintColor,
                      press: _clearSearchQuery,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 8),
          Visibility(
              visible: searchBarCubit.isSearchMode,
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
    context.read<SearchBarCubit>().switchToSearchMode();
  }

  void _stopSearching() {
    _clearSearchQuery();
    context.read<SearchBarCubit>().switchToDiscoverMode();
  }

  void _clearSearchQuery() {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
    _searchQueryController.clear();
    context.read<SearchBarCubit>().switchToSearchMode();
    context.read<AllSearchCubit>().stopQuery();
    context.read<LocationSearchCubit>().stopQuery();
  }
}
