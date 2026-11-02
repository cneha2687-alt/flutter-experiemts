import 'package:flutter/material.dart';

class GridDisplay extends StatefulWidget {
  const GridDisplay({super.key});

  @override
  State<GridDisplay> createState() => _GridDisplayState();
}

class _GridDisplayState extends State<GridDisplay> {

  final topics = [
    "Flutter",
    "Android",
    "Ios",
    "React Native",
    "Xamarin",
    "Unity",
    "Flutter",
    "Android",
    "Ios",
    "React Native",
    "Xamarin",
    "Unity",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 4,
          mainAxisSpacing: 4,
          children: [
            for (final xyz in topics)
            Card(
              color: Colors.blue.shade400,
              child: Center(
                child: Text(xyz),
              ),
            )
          ],
          ),
      ),
    );
  }
}
