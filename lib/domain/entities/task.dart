import 'package:smart_task_manager/domain/value_objects/task_id.dart';
import 'package:smart_task_manager/domain/value_objects/task_status.dart';
import 'package:smart_task_manager/domain/value_objects/task_title.dart';

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

  Task copyWith({
    TaskId? id,
    TaskTitle? title,
    String? description,
    DateTime? dueDate,
    TaskStatus? status,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      dueDate: dueDate ?? this.dueDate,
      status: status ?? this.status,
    );
  }

  Task changeStatus(TaskStatus newStatus) {
    return copyWith(status: newStatus);
  }
}