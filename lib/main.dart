import 'package:flutter/material.dart';
// import 'package:flutter_application_1/stopwatch/sharedpref.dart';
// import 'stopwatch/gridview.dart';
import 'stopwatch/scrollableimage.dart';
// import 'stopwatch/imagecontrol.dart';
// import 'stopwatch/dropdownexmp.dart';
// ignore: unused_import
// import 'stopwatch/calendardemo.dart';
// import 'stopwatch/sliderexmp.dart';
//  import 'stopwatch/chkbox.dart'; 
// import 'stopwatch/textinput.dart';
// import 'stopwatch/loginscreen.dart'; 
// import 'stopwatch/stopwatch_exp.dart';

void main() {
  runApp(const MyCustomStop());
}

class MyCustomStop extends StatelessWidget {
  const MyCustomStop({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:ScrollViewDisplay(),
    );
  }
}