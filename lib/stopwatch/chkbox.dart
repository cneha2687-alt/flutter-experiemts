
import 'package:flutter/material.dart';

class ChkBox extends StatefulWidget {
  const ChkBox({super.key});

  @override
  State<ChkBox> createState() => _ChkBoxState();
}

class _ChkBoxState extends State<ChkBox> {
  bool checked = false;

  void setCheckboxValue() {
    setState(() {
      checked = !checked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: CheckboxListTile(
                title: const Text("Remember me"),
                value: checked,
                onChanged: (v) {
                  setState(() {
                    checked = v!;
                  });
                },
              ),
            ),

            Text('Read: $checked'),

            ElevatedButton(
              onPressed: setCheckboxValue,
              child: const Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}

