import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_task_manager/domain/rules/task_status_policy.dart';

final taskStatusPolicyProvider = Provider<TaskStatusPolicy>((ref) {
  return TaskStatusPolicy();
});
