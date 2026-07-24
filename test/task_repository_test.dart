import 'package:test/test.dart';
import 'package:todo_list/models/task.dart';
import 'package:todo_list/models/urgent_task.dart';
import 'package:todo_list/repositories/task_repository.dart';
import 'package:todo_list/models/normal_task.dart';
import 'package:todo_list/enums/priority.dart';

void main() {
  test('Sauvegarde une tâche', () {
    final repository = TaskRepository();
    repository.save(
      NormalTask(1, "Savegarde Dart", Priority.low, DateTime(2026 - 07 - 25)),
    );
    expect(repository.showAll().length, 1);
  });

  test('Récupérer une tâche via son ID', () {
    final repository = TaskRepository();
    repository.save(
      NormalTask(2, "Recuperer tâche", Priority.high, DateTime(2026 - 07 - 25)),
    );
    final task = repository.findById(2);
    expect(task.id, 2);
  });

  test('Afficher toutes les tâches', () {
    final repository = TaskRepository();
    Task tasks = NormalTask(
      1,
      "Tâche normal",
      Priority.high,
      DateTime(2026 - 07 - 25),
    );
    repository.save(tasks);
    tasks = UrgentTask(
      2,
      "Tâche urgent",
      Priority.medium,
      DateTime(2026 - 07 - 25),
    );
    repository.save(tasks);
    expect(repository.showAll().length, 2);
  });

  test('Supprimer une tâche via son ID', () {
    final repository = TaskRepository();
    repository.save(
      NormalTask(
        3,
        "Supprimé tâche",
        Priority.medium,
        DateTime(2026 - 07 - 25),
      ),
    );
    repository.delete(3);
    expect(repository.showAll().isEmpty, true);
  });

  test('Modifié une tâche via son ID', () {
    final repository = TaskRepository();
    final task = NormalTask(
      4,
      "Supprimé tâche",
      Priority.high,
      DateTime(2026 - 07 - 25),
    );
    repository.save(task);
    task.isCompleted = true;
    repository.update(task);
    expect(repository.findById(4).isCompleted, true);
  });
}
