import 'package:dot/view/chatPage/chat_page.dart';
import 'package:dot/view/game/game_mania.dart';
import 'package:dot/view/homePage/home_page.dart';
import 'package:dot/view/profilePage/profile_page.dart';
import 'package:flutter/material.dart';

class HomeBase extends StatefulWidget {
  const HomeBase({super.key});

  @override
  State<HomeBase> createState() => _HomeBaseState();
}

class _HomeBaseState extends State<HomeBase> {
  int navigationIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('D\u2B24t '), backgroundColor: Theme.of(context).primaryColorLight),
      body: [
        const HomePage(),
        ChatPage(),
        GameMania(),
        const ProfilePage()
      ][navigationIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationIndex,
        onDestinationSelected: (index) {
          setState(() {
            navigationIndex = index;
          });
        },
        backgroundColor: Theme.of(context).primaryColorLight,
      destinations: const [
        NavigationDestination(
            selectedIcon: Icon(Icons.home_filled),
            icon: Icon(Icons.home),
            label: 'home'
        ),
        NavigationDestination(
            selectedIcon: Icon(Icons.chat),
            icon: Icon(Icons.chat_outlined),
            label: 'chat'),
        NavigationDestination(
            selectedIcon: Icon(Icons.gamepad),
            icon: Icon(Icons.gamepad_outlined),
            label: 'game'),
        NavigationDestination(selectedIcon: Icon(Icons.person),
            icon: Icon(Icons.perm_identity_outlined), label: 'profile'),
      ],),
    );
  }
}





