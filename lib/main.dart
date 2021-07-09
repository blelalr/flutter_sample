import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample/navigation/navigation_route.dart';
import 'package:flutter_sample/navigation/navigation_service.dart';
import 'package:flutter_sample/bloc/dialog/dialog_cubit.dart';
import 'package:flutter_sample/page/home_page.dart';
import 'package:flutter_sample/res/app_themes.dart';
import 'bloc/theme/theme_cubit.dart';

void main() {
  debugProfilePaintsEnabled = true;
  runApp(MyApp());
}

//Provider
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => DialogCubit(),
          ),
          BlocProvider(
            create: (context) => ThemeCubit()..getLocalTheme(),
          ),
        ],
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return MaterialApp(
              title: 'Flutter Demo',
              themeMode: state.themeMode,
              theme: AppThemes.lightTheme,
              darkTheme: AppThemes.darkTheme,
              home: MyHomePage(title: 'Flutter Demo'),
              onGenerateRoute: NavigationRoute.instance.generateRoute,
              navigatorKey: NavigationService.instance.navigatorKey,
            );
          },
        ));
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: HomePage());
  }
}
