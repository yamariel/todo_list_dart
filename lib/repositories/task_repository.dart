import 'package:todo_list/exceptions/task_not_found.dart';
import 'package:todo_list/models/task.dart';
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
      throw TaskNotFoundException("IMPOSSIBLE: La tâche avec l'id $id est introuvable.");
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
}
