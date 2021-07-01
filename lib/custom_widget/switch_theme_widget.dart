import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample/bloc/theme/theme_cubit.dart';

class SwitchThemeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeBloc = context.watch<ThemeCubit>();
    return Switch.adaptive(
      value: themeBloc.isDarkMode,
      onChanged: (value) {
        themeBloc.toggleTheme(value);
      },
    );
  }
}
