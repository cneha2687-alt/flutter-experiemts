import 'package:flutter/material.dart';
import 'package:flutter_application_1/resources/imagestrings.dart';

class ScrollViewDisplay extends StatefulWidget {
  const ScrollViewDisplay({super.key});

  @override
  State<ScrollViewDisplay> createState() => _ScrollViewDisplayState();
}

class _ScrollViewDisplayState extends State<ScrollViewDisplay> {

  Widget ScrollDisp() {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: s2.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              s2[index],
              height: 70,
              width: 70,
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ScrollDisp(),
      ),
    );
  }
}