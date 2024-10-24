import 'package:flutter/material.dart';
import 'package:flutter_application_1/functions.dart';
import 'package:flutter_application_1/model.dart';

class addscreen extends StatelessWidget {
  addscreen({super.key});
  final nameeControll = TextEditingController();
  final ageControll = TextEditingController();
  @override
  Widget build(BuildContext context) {
    getdata();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              controller: nameeControll,
              decoration: InputDecoration(hintText: 'name'),
            ),
            TextField(
              controller: ageControll,
              decoration: InputDecoration(hintText: 'age'),
            ),
            ElevatedButton(
              onPressed: () {
                subBtn(context);
              },
              child: Text("submit"),
            ),
          ],
        ),
      ),
    );
  }

  void subBtn(BuildContext context) {
    final name = nameeControll.text.trim();
    final age = ageControll.text.trim();

    if (name.isEmpty || age.isEmpty) {
      return;
    } else {
      Navigator.pop(context);
      final enteredData = person(name: name, age: age);
      addData(enteredData);
    }
  }
}

/////////
