import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/model/task_model.dart';

class ToDoDataBase {
  List<Task> toDoList = [];

  final _myBox = Hive.box('mybox');

  void createInitialData() {
    toDoList = [Task(title: "Test task 1 title", description: "Test task 1 description", status: false)];
  }

  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  void updateDataBase() {
    _myBox.put("TODOLIST", toDoList);
  }
}
