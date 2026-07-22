class TaskFormatException implements Exception {
  final String message;
  TaskFormatException(this.message);

  @override
  String toString() => "TaskFormatException: $message";
}