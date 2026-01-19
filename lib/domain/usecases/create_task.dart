import 'package:smart_task_manager/domain/entities/task.dart';
import 'package:smart_task_manager/domain/repositories/task_repository.dart';
import 'package:smart_task_manager/domain/value_objects/task_id.dart';
import 'package:smart_task_manager/domain/value_objects/task_priority.dart';
import 'package:smart_task_manager/domain/value_objects/task_status.dart';
import 'package:smart_task_manager/domain/value_objects/task_title.dart';

class CreateTask {
  final TaskRepository repository;

  CreateTask({required this.repository});

  Future<void> call({
    required TaskTitle title,
    DateTime? dueDate,
    String? description,
    required TaskPriority priority,
  }) async {
    final task = Task(
      id: TaskId.generate(),
      title: title,
      description: description,
      dueDate: dueDate,
      status: TaskStatus.todo,
      priority: priority,
    );
    await repository.save(task);
  }
}
