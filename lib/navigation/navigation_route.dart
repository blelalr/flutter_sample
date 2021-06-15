import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_sample/page/infinite/infinite_list_bloc/infinite_list_bloc_page.dart';
import 'package:flutter_sample/page/infinite/infinite_list_cubit/infinite_list_cubit_page.dart';
import 'package:flutter_sample/page/infinite/infinite_page.dart';
import 'package:flutter_sample/page/not_found_navigation_widget.dart';
import 'package:flutter_sample/page/state_management/bloc/bloc_page.dart';
import 'package:flutter_sample/page/state_management/cubit/cubit_page.dart';
import 'package:flutter_sample/page/state_management/provider/provider_page.dart';
import 'package:flutter_sample/page/state_management/set_state_page.dart';
import 'package:flutter_sample/page/state_management/state_management_page.dart';

import '../../navigation/navigation_constants.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.STATE_MANAGEMENT:
        return normalNavigate(StateManagementPage());
      case NavigationConstants.SET_STATE:
        return normalNavigate(SetStatePage());
      case NavigationConstants.PROVIDER:
        return normalNavigate(ProviderPage());
      case NavigationConstants.BLOC:
        return normalNavigate(BlocPage());
      case NavigationConstants.CUBIT:
        return normalNavigate(CubitPage());
      case NavigationConstants.INFINITE:
        return normalNavigate(InfinitePage());
      case NavigationConstants.INFINITE_BLOC:
        return normalNavigate(InfiniteListBlocPage());
      case NavigationConstants.INFINITE_CUBIT:
        return normalNavigate(InfiniteListCubitPage());
      default:
        return MaterialPageRoute(
          builder: (context) => NotFoundNavigationWidget(),
        );
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(
      builder: (context) => widget,
    );
  }
}
