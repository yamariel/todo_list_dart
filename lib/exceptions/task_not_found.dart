class TaskNotFoundException implements Exception {
  final String message;

  TaskNotFoundException(this.message);

  @override
  String toString() => "TaskNotFoundException: $message";
}