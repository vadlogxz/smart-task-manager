import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_task_manager/domain/usecases/change_task_status.dart';
import 'package:smart_task_manager/presentation/providers/task_repository_provider.dart';
import 'package:smart_task_manager/presentation/providers/task_status_policy_provider.dart';

final changeTaskStatusProvider = Provider<ChangeTaskStatus>((ref) {
  final policy = ref.read(taskStatusPolicyProvider);
  final repository = ref.read(taskRepositoryProvider);

  return ChangeTaskStatus(
    policy: policy,
    repository: repository
  );
});