import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefExample extends StatefulWidget {
  const SharedPrefExample({super.key});

  @override
  State<SharedPrefExample> createState() => _SharedPrefExampleState();
}

class _SharedPrefExampleState extends State<SharedPrefExample> {
  final nameCntrl = TextEditingController();

  String gender = 'M';
  bool agree = false;

  List<Map<String, dynamic>> items = [];

  static const _key = 'records';

  Future<void> _load() async {
    final pref = await SharedPreferences.getInstance();

    final raw = pref.getString(_key);

    if (raw == null) return;

    final list = jsonDecode(raw) as List;

    setState(() {
      items = list.cast<Map<String, dynamic>>();
    });
  }

  Future<void> _save() async {
    if (nameCntrl.text.trim().isEmpty) return;

    items.add({
      'name': nameCntrl.text,
      'gender': gender,
      'agree': agree,
    });

    final pref = await SharedPreferences.getInstance();

    await pref.setString(_key, jsonEncode(items));

    nameCntrl.clear();

    setState(() {
      gender = "M";
      agree = false;
    });
  }

  @override
  void initState() {
    super.initState();

    _load();
  }

  @override
  void dispose() {
    nameCntrl.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Shared Preferences"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                controller: nameCntrl,
                decoration: const InputDecoration(
                  labelText: "Name",
                  border: OutlineInputBorder(),
                ),
              ),

              RadioListTile<String>(
                title: const Text("Male"),
                value: 'M',
                groupValue: gender,
                onChanged: (v) {
                  setState(() {
                    gender = v!;
                  });
                },
              ),

              RadioListTile<String>(
                title: const Text("Female"),
                value: 'F',
                groupValue: gender,
                onChanged: (v) {
                  setState(() {
                    gender = v!;
                  });
                },
              ),

              CheckboxListTile(
                title: const Text("Agree"),
                value: agree,
                onChanged: (v) {
                  setState(() {
                    agree = v!;
                  });
                },
              ),

              ElevatedButton(
                onPressed: _save,
                child: const Text("Save"),
              ),

              const SizedBox(height: 10),

              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];

                    return ListTile(
                      title: Text(
                        'Name : ${item['name']}',
                      ),
                      subtitle: Text(
                        'Gender : ${item['gender']}',
                      ),
                      trailing: Text(
                        'Agree : ${item['agree']}',
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}