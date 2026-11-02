import 'dart:async';
import 'package:flutter/material.dart';

class MyStopWatch extends StatefulWidget {
  final String name;
  final String email;

  const MyStopWatch({ super.key, required this.name, required this.email,});




  @override
  State<MyStopWatch> createState() {
    return _MyStopWatchState();
  }
}

class _MyStopWatchState extends State<MyStopWatch> {
  late Timer timer;

  bool isRunning = false;
  int milliseconds = 0;

  List<int> laps = [];

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(
      const Duration(milliseconds: 100),
      _onTick,
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void _onTick(Timer timer) {
    if (isRunning) {
      setState(() {
        milliseconds += 100;
      });
    }
  }

  void _startTimer() {
    setState(() {
      isRunning = true;
      milliseconds = 0;
    });
  }

  void _stopTimer() {
    setState(() {
      isRunning = false;
    });
  }

  void _onClickLap() {
    setState(() {
      laps.add(milliseconds);
      milliseconds = 0;
    });
  }

  void lapClear() {
    setState(() {
      laps.clear();
      milliseconds = 0;
      isRunning = false;
    });
  }

  String _millisecondsToText(int millis) {
    return "${(millis / 1000).toStringAsFixed(1)} sec";
  }

  Widget _buildCounter(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
        widget.email,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          _millisecondsToText(milliseconds),
          style: const TextStyle(
            fontSize: 35,
          ),
        ),
      ],
    );
  }

  Widget _buildControls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: _startTimer,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
          ),
          child: const Text("Start"),
        ),
        ElevatedButton(
          onPressed: _onClickLap,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
          ),
          child: const Text("Lap"),
        ),
        ElevatedButton(
          onPressed: _stopTimer,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
          ),
          child: const Text("Stop"),
        ),
        ElevatedButton(
          onPressed: lapClear,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            foregroundColor: Colors.white,
          ),
          child: const Text("Clear"),
        ),
      ],
    );
  }

  Widget _buildListViewBuilder() {
    return ListView.builder(
      itemCount: laps.length,
      itemBuilder: (context, index) {
        final millis = laps[index];

        return ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          leading: const Icon(Icons.timer),
          title: Text("Lap ${index + 1}"),
          trailing: Text(
            _millisecondsToText(millis),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(widget.name),
      ),
      body: Column(
        children: [
          Expanded(
            child: _buildCounter(context),
          ),
          const SizedBox(height: 20),
          _buildControls(),
          const SizedBox(height: 20),
          Expanded(
            child: _buildListViewBuilder(),
          ),
        ],
      ),
    );
  }
}