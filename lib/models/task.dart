import 'package:todo_list/enums/priority.dart';

abstract class Task {
  final int id;
  String title;
  Priority priority;
  DateTime? date;
  bool isCompleted;
  Task(this.id, this.title,this.priority, this.date, this.isCompleted);

  void showTask() {
    print("ID: $id");
    print("Titre: $title");
    print("Priorité: $priority");
    print("Date limite: $date");
    print("Terminée ?: $isCompleted");
  }
}