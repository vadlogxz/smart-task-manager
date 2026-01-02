import 'package:smart_task_manager/domain/entities/task_status.dart';

class InvalidTaskStatusTransition implements Exception {
  final TaskStatus fromStatus;
  final TaskStatus toStatus;

  InvalidTaskStatusTransition({
    required this.fromStatus,
    required this.toStatus,
  });

  @override
  String toString() {
    return 'InvalidTaskStatusTransition: Cannot change status from $fromStatus to $toStatus';
  }
}
