import 'package:flutter/material.dart';
import 'Paint/painter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Offset offset = const Offset(-100.0, 0.0);
  int navigationIndex = 0;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Size screenSize = MediaQuery.of(context).size;
      double width = screenSize.width / 2.0;
      double height = screenSize.height / 2.0;
      offset = Offset(width, height);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('D\u2B24t '), backgroundColor: Theme.of(context).primaryColorLight),
      body: [Center(
          child: GestureDetector(
            onTap: () => setState(() {}),
            onPanUpdate: (event) {
              setState(() {
                double dx = event.localPosition.dx;
                double dy = event.localPosition.dy;
                offset = Offset(dx, dy);
              });
            },
            child: CustomPaint(
              painter: DotPainter(),
              foregroundPainter: ForGroundPainter(offset),
              child: Container(),
            ),
          ),
        ),
        const SearchMe(), const GameMania(), const ProfileJi()][navigationIndex],
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
            selectedIcon: Icon(Icons.search_outlined),
            icon: Icon(Icons.search),
            label: 'search'),
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

class SearchMe extends StatelessWidget {
  const SearchMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text('Search Me');
  }
}

class GameMania extends StatelessWidget {
  const GameMania({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text('Game Mania');
  }
}
class ProfileJi extends StatelessWidget {
  const ProfileJi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text('Profile Ji');
  }
}



