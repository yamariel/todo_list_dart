import 'package:todo_list/enums/priority.dart';
import 'package:todo_list/exceptions/task_format.dart';
import 'package:todo_list/exceptions/task_not_found.dart';
import 'package:todo_list/models/normal_task.dart';
import 'package:todo_list/models/task.dart';
import 'package:todo_list/models/urgent_task.dart';
import 'package:todo_list/repositories/repository.dart';

class TaskRepository extends Repository<Task> {
  final List<Task> _tasks = [];

  @override
  void save(Task element) {
    _tasks.add(element);
  }

  @override
  Task findById(int id) {
    try {
      return _tasks.firstWhere((task) => task.id == id);
    } on StateError {
      throw TaskNotFoundException(
        "IMPOSSIBLE: La tâche avec l'id $id est introuvable.",
      );
    }
  }

  @override
  List<Task> showAll() {
    return _tasks;
  }

  @override
  void delete(int id) {
    findById(id);
    _tasks.removeWhere((task) => task.id == id);
  }

  @override
  void update(Task element) {
    final index = _tasks.indexWhere((task) => task.id == element.id);
    if (index == -1) {
      throw TaskNotFoundException(
        "IMPOSSIBLE DE METTRE A JOUR: La tâche avec l'id ${element.id} est introuvable.",
      );
    }

    _tasks[index] = element;
  }

  Task jsonToTask(Map<String, dynamic> json) {
    final priority = Priority.values.firstWhere(
      (p) => p.name == (json["priority"] as String),
    );
    final date = json["date"] == null
        ? null
        : DateTime.parse(json["date"] as String);

    if (json["type"] == "normal") {
      return NormalTask(
        json["id"] as int,
        json["title"] as String,
        priority,
        date,
      );
    } else if (json["type"] == "urgent") {
      return UrgentTask(
        json["id"] as int,
        json["title"] as String,
        priority,
        date,
      );
    } else {
      throw TaskFormatException("Le type de tâche n'existe pas.");
    }
  }
}
