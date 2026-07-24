import 'package:todo_list/models/task.dart';
import 'package:todo_list/repositories/task_repository.dart';

abstract interface class TaskAction {
  void createTask(TaskRepository repository);
  void deleteTask(TaskRepository repository);
  void completeTask(TaskRepository repository);
  List<Task> listTasks(TaskRepository repository);
}