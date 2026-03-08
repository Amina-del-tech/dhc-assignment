import 'package:flutter/material.dart';
import 'package:my_flutter_journey/screens/models/task_model.dart';
import 'package:shared_preferences/shared_preferences.dart';


class TaskProvider with ChangeNotifier {
  List<Task> _tasks = [];
  bool _isDarkMode = false;

  List<Task> get tasks => _tasks;
  bool get isDarkMode => _isDarkMode;

  TaskProvider() {
    _loadDarkMode(); // App start pe load karenge
  }

  void _loadDarkMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isDarkMode = prefs.getBool('isDarkMode') ?? false;
    notifyListeners();
  }

  void toggleDarkMode(bool val) async {
    _isDarkMode = val;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', val);
    notifyListeners();
  }

  void addTask(String title, String description) {
    _tasks.add(Task(title: title, description: description));
    notifyListeners();
  }

  void removeTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }

  void updateTask(int index, String title, String description) {
    _tasks[index].title = title;
    _tasks[index].description = description;
    notifyListeners();
  }

  void toggleTaskCompletion(int index) {
    _tasks[index].isDone = !_tasks[index].isDone;
    notifyListeners();
  }

  void clearAllTasks() {
    _tasks.clear();
    notifyListeners();
  }

  // Agar aapne Task me priority/tag add kiye hain:
  void addTaskWithExtras(String title, String description, String priority, String tag) {
    _tasks.add(Task(title: title, description: description, priority: priority, tag: tag));
    notifyListeners();
  }

  void updateTaskWithExtras(int index, String title, String description, String priority, String tag) {
    _tasks[index].title = title;
    _tasks[index].description = description;
    _tasks[index].priority = priority;
    _tasks[index].tag = tag;
    notifyListeners();
  }
}