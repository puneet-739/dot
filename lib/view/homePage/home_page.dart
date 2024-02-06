import 'package:flutter/material.dart';
import '../../Paint/painter.dart';
import '../../main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Offset offset = const Offset(-100.0, 0.0);
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
    customContext = context;
    return Center(
      child: GestureDetector(
        onTap: () {
          setState(() {});
          // CommonUI.testSnackBar(customContext!, 'Hey dot', FirebaseService.fcmToken.toString());
        },
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
    );
  }
}