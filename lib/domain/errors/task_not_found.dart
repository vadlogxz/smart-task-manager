import '../value_objects/task_id.dart';

class TaskNotFound implements Exception {
  final TaskId taskId;

  TaskNotFound(this.taskId);

  @override
  String toString() => 'Task with id $taskId not found';
}
