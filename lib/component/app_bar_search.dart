import 'package:flutter/material.dart';
import 'package:flutter_sample/bloc/theme/theme_cubit.dart';
import 'package:flutter_sample/component/icon_button_default.dart';
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
  bool _isSearching = false;
  String searchQuery = "Search query";
  @override
  Widget build(BuildContext context) {
    final themeCubit = context.watch<ThemeCubit>();
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 8),
      child: Row(
        children: [
          Visibility(
              visible: (_isSearching == false),
              child: IconButtonDefault(
                  iconPath: 'assets/icon/arrow_left.svg',
                  size: 16,
                  press: () => Navigator.pop(context))),
          Visibility(
              visible: (_isSearching == true),
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
                      autofocus: false,
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
              visible: (_isSearching == true),
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

  List<Widget> _buildActions() {
    if (_isSearching) {
      return <Widget>[
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            if (_searchQueryController == null ||
                _searchQueryController.text.isEmpty) {
              Navigator.pop(context);
              return;
            }
            _clearSearchQuery();
          },
        ),
      ];
    }

    return <Widget>[
      IconButton(
        icon: const Icon(Icons.search),
        onPressed: _startSearch,
      ),
    ];
  }

  void _startSearch() {
    // ModalRoute.of(context)
    //     ?.addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));

    setState(() {
      _isSearching = true;
    });
  }

  void updateSearchQuery(String newQuery) {
    setState(() {
      searchQuery = newQuery;
    });
  }

  void _stopSearching() {
    _clearSearchQuery();

    FocusScopeNode currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }

    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearchQuery() {
    setState(() {
      _searchQueryController.clear();
      updateSearchQuery("");
    });
  }
}
