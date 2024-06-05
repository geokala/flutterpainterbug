import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Painterbug?',
      home: MyHomePage(title: 'Painterbug?'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(child: Column(
        children: [
          ElevatedButton(
            onPressed: showBug,
            child: const Text('Show transparency with a hole.'),
          ),
        ],
      )),
    );
  }

  void showBug() {
    final size = MediaQuery.of(context).size;
    OverlayState overlayState = Overlay.of(context);

    overlayState.insert(
      OverlayEntry(
        builder: (context) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              children: [
                CustomPaint(
                  size: size,
                  painter: HolePainter(
                    dx: 300.0,
                    dy: 300.0,
                    width: 56.0,
                    height: 56.0,
                    borderRadius: const Radius.circular(10.0),
                  )
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}


class HolePainter extends CustomPainter {
  final double dx;
  final double dy;
  final double width;
  final double height;
  final Radius borderRadius;

  HolePainter({
    required this.dx,
    required this.dy,
    required this.width,
    required this.height,
    required this.borderRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.black.withOpacity(0.6);
    canvas.drawPath(
        Path.combine(
          PathOperation.difference,
          Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height)),
          Path()
            ..addOval(Rect.fromCircle(
                center: Offset(dx, dy), radius: width))
            ..close(),
        ),
        paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
