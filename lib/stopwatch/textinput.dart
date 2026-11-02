import 'package:flutter/material.dart';

class Textinput extends StatefulWidget {
  const Textinput({super.key});

  @override
  State<Textinput> createState() => _TextinputState();
}

class _TextinputState extends State<Textinput> {
  final TextEditingController controller = TextEditingController();

  String text = '';

  // Set method
  void setText(String value) {
    setState(() {
      text = value;
    });
  }

  // Get method
  String getText() {
    return text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Text',
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                setText(controller.text);
              },
              child: const Text('Read Text'),
            ),

            const SizedBox(height: 20),

            Text('Read: ${getText()}'),
          ],
        ),
      ),
    );
  }
}