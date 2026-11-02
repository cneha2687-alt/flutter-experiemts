import 'package:flutter/material.dart';

class CalendarExmp extends StatefulWidget {
  const CalendarExmp({super.key});

  @override
  State<CalendarExmp> createState() => _CalendarExmpState();
}

class _CalendarExmpState extends State<CalendarExmp> {
  DateTime? date;
  void serDateValue(){
    setState(() {
      date = DateTime(2027,10,12);
    });
  }

  Future<void> pickDate() async{
    final DateTime? picked = await  showDatePicker(
      context: context,
      initialDate:date ?? DateTime.now() ,
       firstDate: DateTime(2000),
        lastDate: DateTime(2100),
    );
    if (!mounted || picked == null) return;
    setState(()  => date = picked);
  }
  @override
  Widget build(BuildContext context) {
    final text = date == null
    ? 'No date selected'
    : '${date!.day}/${date!.month}/${date!.year}';
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text),
            ElevatedButton(
              onPressed: pickDate,
               child: const Text("Pick Date"),
               ),
               ElevatedButton(
                onPressed: serDateValue,
                 child: const Text("Submit"),
                 ),
          ],
        )
      ),
    );
  }
}