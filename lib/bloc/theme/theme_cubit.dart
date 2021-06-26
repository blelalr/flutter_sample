import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState(themeMode: ThemeMode.system));

  void toggleTheme(bool isDarkMode) {
    emit(ThemeState(themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light));
  }
}
