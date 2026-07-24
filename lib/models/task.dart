import 'package:todo_list/enums/priority.dart';

abstract class Task {
  final String type;
  final int id;
  String title;
  Priority priority;
  DateTime? date;
  bool isCompleted;
  Task(this.type, this.id, this.title,this.priority, this.date, this.isCompleted);

  void showTask() {
    print("ID: $id");
    print("Titre: $title");
    print("Priorité: ${priority.name}");
    print("Date limite: ${date?.toString()}");
    print("Terminée ?: $isCompleted\n");
  }

    Map<String, dynamic> taskToJson() {
    return {
      "type": type,
      "id": id,
      "title": title,
      "priority": priority.name,
      "date": date?.toString(),
      "isCompleted": isCompleted,
    };
  }
}