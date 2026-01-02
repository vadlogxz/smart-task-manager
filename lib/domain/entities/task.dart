import 'package:smart_task_manager/domain/entities/task_id.dart';
import 'package:smart_task_manager/domain/entities/task_status.dart';
import 'package:smart_task_manager/domain/entities/task_title.dart';

class Task {
  final TaskId id;
  final TaskTitle title;
  final String? description;
  final DateTime dueDate;
  final TaskStatus status;

  Task({
    required this.id,
    required this.title,
    this.description,
    required this.dueDate,
    required this.status,
  });
}