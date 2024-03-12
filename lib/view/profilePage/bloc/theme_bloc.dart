import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'theme_event.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeMode> {
  ThemeBloc(): super(ThemeMode.system) {
    on<LightEvent>((event, emit) =>  emit(ThemeMode.light));
    on<DarkEvent>((event, emit) => emit(ThemeMode.dark));
  }
}
