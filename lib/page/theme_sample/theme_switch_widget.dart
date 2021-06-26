import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample/bloc/theme/theme_cubit.dart';

class ThemeSwitchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeBloc = context.watch<ThemeCubit>();
    return Switch.adaptive(
      value: themeBloc.state.themeMode == ThemeMode.dark,
      onChanged: (value) {
        themeBloc.toggleTheme(value);
      },
    );
  }
}
