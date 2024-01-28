library my_library;

import 'package:flutter/foundation.dart';
import 'package:todos/models/task.dart';
import 'dart:collection';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
//import 'package:todos/screens/add_task_screen.dart';

class TaskData extends ChangeNotifier {
  static const String key = 'tasks';

  List<Task> _tasks = [
    // Task(name: 'buy milk'),
    // Task(name: 'buy food'),
    // Task(name: 'buy bread'),
  ];

  TaskData() {
    _loadTasks();
  }

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle);
    _tasks.add(task);
    _saveTasks();
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    _saveTasks();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    _saveTasks();
    notifyListeners();
  }

  Future<void> _saveTasks() async { 
    final prefs = await SharedPreferences.getInstance();
    final List<String> encodedTasks =
        _tasks.map((task) => json.encode(task.toMap())).toList();
    prefs.setStringList('tasks', encodedTasks);
  }

  void _loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? encodedTasks = prefs.getStringList(key);

    if (encodedTasks != null) {
      _tasks = encodedTasks
          .map((encodedTask) =>
              Task.fromMap(json.decode(encodedTask) as Map<String, dynamic>))
          .toList();
      notifyListeners();
    }
  }
}
