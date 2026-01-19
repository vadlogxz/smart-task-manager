import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_task_manager/domain/entities/task.dart';
import 'package:smart_task_manager/domain/value_objects/task_id.dart';
import 'package:smart_task_manager/domain/value_objects/task_status.dart';
import 'package:smart_task_manager/presentation/providers/change_task_status_provider.dart';
import 'package:smart_task_manager/presentation/providers/task_repository_provider.dart';

class TaskListNotifier extends AsyncNotifier<List<Task>> {

  @override
  Future<List<Task>> build() async {
    final repository = ref.read(taskRepositoryProvider);
    final List<Task> tasks = await repository.getAll();
    return tasks;
  }

  Future<void> changeStatus(TaskId taskId, TaskStatus newStatus) async {
    final usecase = ref.read(changeTaskStatusProvider);
    await usecase(taskId, newStatus);
    state = AsyncData(await ref.read(taskRepositoryProvider).getAll());
  }

  Future<void> reload() async {
    final repo = ref.read(taskRepositoryProvider);
    state = const AsyncLoading();
    state = AsyncData(await repo.getAll());
  }
}
