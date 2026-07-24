import 'package:todo_list/repositories/task_repository.dart';
import 'package:todo_list/services/task_service.dart';
import 'package:todo_list/services/user_choise.dart';

Future<void> main() async {
  print("Application CLI de gestion de tâches");

  final repository = TaskRepository();
  await repository.loadFromFile("tasks.json");

  final service = TaskService();
  final menu = UserChoise();

  int choice;

  do {
    choice = menu.userChoise();

    switch (choice) {
      case 1:
        await service.createTask(repository);
        break;

      case 2:
        service.listTasks(repository);
        break;

      case 3:
        await service.completeTask(repository);
        break;

      case 4:
        await service.deleteTask(repository);
        break;

      case 0:
        print("Au revoir !");
        break;

      default:
        print("Choix invalide.");
    }
  } while (choice != 0);
}
