import 'package:flutter/material.dart';

class RadioInput extends StatefulWidget {
  const RadioInput({super.key});

  @override
  State<RadioInput> createState() => _RadioInputState();
}

class _RadioInputState extends State<RadioInput> {
  String? _gender;

  // Setter
  set gender(String? value) {
    setState(() {
      _gender = value;
    });
  }

  // Getter
  String? get gender {
    return _gender;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          RadioListTile(
            title: const Text('Male'),
            value: 'M',
            groupValue: gender,
           onChanged: (value) {gender = value;
            },
          ),

          RadioListTile(
            title: const Text('Female'),
            value: 'F',
            groupValue: gender,
            onChanged: (value) {gender = value;},
          ),
        ],
      ),
    );
  }
}