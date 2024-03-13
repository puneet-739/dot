import 'package:dot/view/chatPage/chat_page.dart';
import 'package:dot/view/game/game_mania.dart';
import 'package:dot/view/homeBase/bloc/home_base_bloc.dart';
import 'package:dot/view/homeBase/bloc/home_base_event.dart';
import 'package:dot/view/homeBase/bloc/home_base_state.dart';
import 'package:dot/view/homePage/home_page.dart';
import 'package:dot/view/profilePage/presentation/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../widgets/dot_app_bar.dart';

class HomeBase extends StatefulWidget {
  const HomeBase({super.key});

  @override
  State<HomeBase> createState() => _HomeBaseState();
}

class _HomeBaseState extends State<HomeBase> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBaseBloc, HomeBaseState>(
      builder: (BuildContext context, HomeBaseState state) {
        return Scaffold(
          appBar: const DotAppBar(),
          body: switch(state) {
            HomeBaseState.home => const HomePage(),
            HomeBaseState.chat => ChatPage(),
            HomeBaseState.game => GameMania(),
            HomeBaseState.profile => const ProfilePage(),
          },
          bottomNavigationBar: NavigationBar(
            selectedIndex: state.index,
            onDestinationSelected: (index) {
              context.read<HomeBaseBloc>().add(HomeBaseEventEnum.values[index].event);
            },
            backgroundColor: Theme.of(context).primaryColorLight,
            destinations: const [
              NavigationDestination(
                  selectedIcon: Icon(Icons.home_filled),
                  icon: Icon(Icons.home),
                  label: 'home'),
              NavigationDestination(
                  selectedIcon: Icon(Icons.chat),
                  icon: Icon(Icons.chat_outlined),
                  label: 'chat'),
              NavigationDestination(
                  selectedIcon: Icon(Icons.gamepad),
                  icon: Icon(Icons.gamepad_outlined),
                  label: 'game'),
              NavigationDestination(
                  selectedIcon: Icon(Icons.person),
                  icon: Icon(Icons.perm_identity_outlined),
                  label: 'profile'),
            ],
          ),
        );
      },
    );
  }
}
