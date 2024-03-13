import 'package:dot/view/profilePage/bloc/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingBottomSheet extends StatelessWidget {
  SettingBottomSheet({super.key});
  late Brightness platformBrightness;
  @override
  Widget build(BuildContext context) {
    platformBrightness = MediaQuery.of(context).platformBrightness;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const Text(
                "Theme",
                style: TextStyle(fontSize: 20.0),
              ),
              BlocBuilder<ThemeBloc, ThemeMode>(
                builder: (context, state) {
                  return IconButton(
                      onPressed: () {
                        ThemeEvent themeEvent = systemThemeCheck(state) == ThemeMode.light
                            ? DarkEvent()
                            : LightEvent();
                        context.read<ThemeBloc>().add(themeEvent);
                      },
                      icon: systemThemeCheck(state) == ThemeMode.light
                          ? const Icon(Icons.dark_mode, size: 30.0)
                          : const Icon(Icons.light_mode));
                },
              ),
            ],
          ),
          Row(
            children: [
              const Text("use system theme"),
              const SizedBox(width: 10.0,),
              BlocBuilder<ThemeBloc, ThemeMode>(
                builder: (context, state) {
                  return Switch(value: state == ThemeMode.system, onChanged: (value) {
                    if(state == ThemeMode.system) {
                      ThemeEvent themeEvent = platformBrightness == Brightness.light
                          ? LightEvent()
                          : DarkEvent();
                      context.read<ThemeBloc>().add(themeEvent);
                    } else {
                      context.read<ThemeBloc>().add(SystemThemeEvent());
                    }
                  });
                },
              )
            ],
          )
        ],
      ),
    );
  }

  ThemeMode systemThemeCheck(ThemeMode state) {
    if(state != ThemeMode.system) {
      return state;
    } else {
      return platformBrightness == Brightness.light? ThemeMode.light: ThemeMode.dark;
    }
  }
}
