import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_task_manager/domain/entities/task.dart';
import 'package:smart_task_manager/presentation/notifiers/task_list_notifier.dart';

final taskListProvider = AsyncNotifierProvider<TaskListNotifier, List<Task>>(() {
  return TaskListNotifier();
});