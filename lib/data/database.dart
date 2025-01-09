import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List<dynamic> toDoList = [];

  final _myBox = Hive.box('mybox');

  // إنشاء بيانات أولية
  void createInitialData() {
    toDoList = [
      ['Create Flutter App', false],
    ];
    updateDataBase();
  }

  // تحميل البيانات
  void loadData() {
    toDoList = List<dynamic>.from(_myBox.get('TODOLIST', defaultValue: []));
  }

  // تحديث قاعدة البيانات
  void updateDataBase() {
    _myBox.put('TODOLIST', toDoList);
  }
}
