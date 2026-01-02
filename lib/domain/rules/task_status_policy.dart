import 'package:smart_task_manager/domain/entities/task.dart';
import 'package:smart_task_manager/domain/entities/task_status.dart';

import '../../errors/invalid_task_status_transition.dart';

class TaskStatusPolicy {

  void assertCanChangeStatus(Task task, TaskStatus newStatus) {
    if(task.status == TaskStatus.blocked && newStatus == TaskStatus.inProgress) {
      throw InvalidTaskStatusTransition(
        fromStatus: task.status,
        toStatus: newStatus,
      );
    }

    if(task.status == TaskStatus.done && newStatus != TaskStatus.done) {
      throw InvalidTaskStatusTransition(
        fromStatus: task.status,
        toStatus: newStatus,
      );
    }

    if(task.status == TaskStatus.inProgress && newStatus == TaskStatus.todo) {
      throw InvalidTaskStatusTransition(
        fromStatus: task.status,
        toStatus: newStatus,
      );
    }

    if(task.status == TaskStatus.todo && newStatus == TaskStatus.done) {
      throw InvalidTaskStatusTransition(
        fromStatus: task.status,
        toStatus: newStatus,
      );
    }
  }
}