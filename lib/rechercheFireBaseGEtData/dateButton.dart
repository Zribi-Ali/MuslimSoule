import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'GetDataFierBase.dart';

class DateField extends StatefulWidget {
  const DateField({Key? key}) : super(key: key);

  @override
  _DateFieldState createState() => _DateFieldState();
}

class _DateFieldState extends State<DateField> {
  TextEditingController dateFController = TextEditingController();
  TextEditingController dateSController = TextEditingController();

  Future<void> _selectDate(TextEditingController controller) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        controller.text = DateFormat('dd/MM/yyyy').format(pickedDate);
        print(controller.text);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                readOnly: true,
                showCursor: true,
                decoration: const InputDecoration(
                  labelText: 'Entre le',
                  hintText: 'JJ/MM/AAAA',
                ),
                controller: dateFController,
                onTap: () => _selectDate(dateFController),
              ),
              TextField(
                readOnly: true,
                showCursor: true,
                decoration: const InputDecoration(
                  labelText: 'Et le',
                  hintText: 'JJ/MM/AAAA',
                ),
                controller: dateSController,
                onTap: () => _selectDate(dateSController),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ShowData(
                        date1: dateFController.text,
                        date2: dateSController.text,
                      ),
                    ),
                  );
                },
                child: const Text("Imprimer"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
