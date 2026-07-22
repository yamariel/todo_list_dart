import 'package:todo_list/enums/priority.dart';
import 'package:todo_list/models/task.dart';

class UrgentTask extends Task {

  UrgentTask(
    int id,
    String title,
    Priority priority,
    DateTime? date, {
    bool isCompleted = false,
  }) : super(id, title, priority, date, isCompleted);
  
  @override
  void showTask() {
    print("==== TÂCHE URGENTE !! ====");
    super.showTask();
  }
}
