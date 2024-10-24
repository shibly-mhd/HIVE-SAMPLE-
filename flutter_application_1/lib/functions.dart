import 'package:flutter/material.dart';
import 'package:flutter_application_1/model.dart';
import 'package:hive/hive.dart';

ValueNotifier<List<person>> personNofier = ValueNotifier([]);
Future<void> addData(person value) async {
  final data = await Hive.openBox<person>('db');
  data.add(value);
  getdata();
}
Future<void> getdata() async {
  final data = await Hive.openBox<person>('db');
  personNofier.value.clear();
  personNofier.value.addAll(data.values);
  personNofier.notifyListeners();
}

Future<void> deleteData(int index) async {
  final data = await Hive.openBox<person>('db');
  data.deleteAt(index);
  getdata();
}
