part of 'theme_bloc.dart';

sealed class ThemeEvent {}

class LightEvent extends ThemeEvent {}

class DarkEvent extends ThemeEvent {}

class SystemThemeEvent extends ThemeEvent {}
