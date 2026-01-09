import 'package:smart_task_manager/domain/entities/task.dart';
import 'package:smart_task_manager/domain/value_objects/task_status.dart';
import 'package:smart_task_manager/domain/repositories/task_repository.dart';
import 'package:smart_task_manager/domain/rules/task_status_policy.dart';

import '../errors/task_not_found.dart';
import '../value_objects/task_id.dart';

class ChangeTaskStatus {
  final TaskRepository repository;
  final TaskStatusPolicy policy;

  ChangeTaskStatus({required this.repository, required this.policy});

  Future<void> call(TaskId taskId, TaskStatus newStatus) async {
    final Task? task = await repository.getById(taskId);

    if (task == null) {
      throw TaskNotFound(taskId);
    }

    policy.assertCanChangeStatus(task, newStatus);

    final updatedTask = task.changeStatus(newStatus);

    await repository.save(updatedTask);
  }
}
