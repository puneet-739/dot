import 'package:dot/view/profilePage/bloc/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DotAppBar extends StatefulWidget implements PreferredSizeWidget {
  const DotAppBar({super.key});

  @override
  State<DotAppBar> createState() => _DotAppBarState();

  @override
  Size get preferredSize => const Size(double.infinity, 56.0);
}

class _DotAppBarState extends State<DotAppBar> {
  final ThemeBloc themeBloc = ThemeBloc();

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: const Text('D\u2B24t '),
        actions: [
          BlocBuilder<ThemeBloc, ThemeMode>(
            builder: (context, state) {
              return IconButton(
                  onPressed: () {
                    ThemeEvent themeEvent = state == ThemeMode.light ? DarkEvent() : LightEvent();
                    context.read<ThemeBloc>().add(themeEvent);
                  },
                  icon: state == ThemeMode.light
                      ? const Icon(Icons.dark_mode)
                      : const Icon(Icons.light_mode));
            },
          )
        ],
        backgroundColor: Theme.of(context).primaryColorLight);
  }
}
