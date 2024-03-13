import 'package:dot/view/homeBase/bloc/home_base_bloc.dart';
import 'package:dot/view/homeBase/bloc/home_base_state.dart';
import 'package:dot/view/profilePage/bloc/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../view/profilePage/presentation/setting_bottom_sheet.dart';

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
          BlocBuilder<HomeBaseBloc, HomeBaseState>(
            builder: (context, state) {
              if (state == HomeBaseState.profile) {
                return IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) => SettingBottomSheet());
                    },
                    icon: const Icon(Icons.settings));
              }
              return Container();
            },
          )
        ],
        backgroundColor: Theme.of(context).primaryColorLight);
  }
}
