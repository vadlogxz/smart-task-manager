import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_task_manager/domain/value_objects/task_status.dart';
import 'package:smart_task_manager/presentation/widgets/task_tile.dart';

import '../providers/task_list_provider.dart';

class TaskListScreen extends ConsumerWidget {
  const TaskListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasksAsync = ref.watch(taskListProvider);

    final body = tasksAsync.when(
      data: (tasks) {
        return ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            final task = tasks[index];
            return TaskTile(
              task: task,

              onStatusChanged: (TaskStatus updatedStatus) {
                ref.read(taskListProvider.notifier).changeStatus(task.id, updatedStatus);
              },
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('Error: $error')),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Task List'),
      ),
      body: body,
    );
  }
}
