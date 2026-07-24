import 'dart:io';

import 'package:todo_list/enums/priority.dart';
import 'package:todo_list/exceptions/task_not_found.dart';
import 'package:todo_list/models/normal_task.dart';
import 'package:todo_list/models/task.dart';
import 'package:todo_list/models/urgent_task.dart';
import 'package:todo_list/repositories/task_repository.dart';

class TaskService {
  Future<void> createTask(TaskRepository repository) async {
    print(
      "Quel type de tâche vous voulez crée ?:\n 1. Tâche normale\n 2. Tâche urgente",
    );
    final choice = int.tryParse(stdin.readLineSync() ?? '');
    if (choice == null) {
      print("Veuillez entrer un nombre.");
      return;
    }

    print("Entrez le titre de la tâche :");
    final title = stdin.readLineSync()!;

    print(
      "Entrez la priorité de la tâche (1. low, 2. medium, 3. high) medium par défaut:",
    );
    final priorityInput = int.tryParse(stdin.readLineSync() ?? '');

    if (priorityInput == null) {
      print("Veuillez entrer un nombre.");
      return;
    }

    final priority = priorityInput == 1
        ? Priority.low
        : priorityInput == 3
        ? Priority.high
        : Priority.medium;

    print(
      "Entrez la date de la tâche (Année-Mois-Jour) par défaut c'est la date actuelle:",
    );
    final date =
        DateTime.tryParse(stdin.readLineSync() ?? '') ?? DateTime.now();
    int id = repository.nextId();
    final Task task = choice == 1
        ? NormalTask(id, title, priority, date)
        : UrgentTask(id, title, priority, date);

    repository.save(task);
    await repository.saveToFile('tasks.json');
  }

  List<Task> listTasks(TaskRepository repository) {
    List<Task> tasks = repository.showAll();
    if (tasks.isEmpty) {
      print("Aucune tâche enregistrée");
      return [];
    }
    for (final task in tasks) {
      task.showTask();
    }
    return tasks;
  }

  Future<void> deleteTask(TaskRepository repository) async {
    print("Entrez l'id de la tâche:");
    final taskId = int.tryParse(stdin.readLineSync() ?? '');

    if (taskId != null) {
      try {
        repository.delete(taskId);
        await repository.saveToFile('tasks.json');
        print("Tâche supprimée avec succès.");
      } on TaskNotFoundException catch (e) {
        print(e);
      }
    }
  }

  Future<void> completeTask(TaskRepository repository) async {
    print("Entrez l'id de la tâche:");
    final id = int.tryParse(stdin.readLineSync() ?? '');
    if (id != null) {
      try {
        Task task = repository.findById(id);
        task.isCompleted = true;
        repository.update(task);
        await repository.saveToFile('tasks.json');
      } on TaskNotFoundException catch (e) {
        print(e);
      }
    }
  }
}
