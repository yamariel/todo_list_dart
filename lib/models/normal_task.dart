import 'package:todo_list/enums/priority.dart';
import 'package:todo_list/models/task.dart';

class NormalTask extends Task {
  NormalTask(
    int id,
    String title,
    Priority priority,
    DateTime? date, {
    bool isCompleted = false,
  }) : super("normal", id, title, priority, date, isCompleted);

  @override
  void showTask() {
    print("==== TÂCHE NORMALE ====");
    super.showTask();
  }
}
