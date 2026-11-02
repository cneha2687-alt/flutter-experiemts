import 'package:flutter/material.dart';

class ColorPage extends StatefulWidget {
  ColorPage({super.key});

  @override
  State<ColorPage> createState() => _ColorPageState();
}

class _ColorPageState extends State<ColorPage> {
  var colors = [Colors.yellow, Colors.red, Colors.grey, Colors.purple];

  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Color App')),
      body: Column(
        children: [
          Expanded(
            child: Container(color: colors[(0 + count) % (colors.length)]),
          ),
          Expanded(
            child: Container(color: colors[(1 + count) % (colors.length)]),
          ),
          Expanded(
            child: Container(color: colors[(2 + count) % (colors.length)]),
          ),
          Expanded(
            child: Container(color: colors[(3 + count) % (colors.length)]),
          ),
          ElevatedButton(
            onPressed: () {
              count++;
              setState(() {});
              print('Button clicked $count');
            },
            child: Text('Change'),
          ),
        ],
      ),
    );
  }
}