import 'package:flutter/material.dart';

class SlideExample extends StatefulWidget {
  const SlideExample({super.key});

  @override
  State<SlideExample> createState() => _SlideExampleState();
}

class _SlideExampleState extends State<SlideExample> {
  double val = 20;
  void setSliderVlue(double v){
    setState(() {
      val = v;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Slider(
              value: val,
              min: 0,
              max: 100,
              divisions: 100,
               onChanged: (v) => setState(() => val =v ),   
               ),
               Text('Value:$val'),
               ElevatedButton(
                onPressed: () => setSliderVlue(50),
                 child: const Text ("Submit"),
                 )
          ],
        ))
    );
  }
}