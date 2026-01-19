import 'package:flutter/material.dart';
import 'package:smart_task_manager/domain/entities/task.dart';
import 'package:smart_task_manager/domain/value_objects/task_status.dart';
import 'package:smart_task_manager/presentation/extensions/task_status_ui.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final void Function(TaskStatus) onStatusChanged;

  const TaskTile({
    super.key,
    required this.task,
    required this.onStatusChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task.title.toString()),
      subtitle: Text(task.status.label),
      trailing: PopupMenuButton <TaskStatus>(
        onSelected: (TaskStatus selectedStatus) {
          onStatusChanged(selectedStatus);
        },
        itemBuilder: (BuildContext context) {
          return TaskStatus.values.map((TaskStatus status) {
            return PopupMenuItem(
              value: status,
              child: Text(status.label),
            );
          }).toList();
        },
      ),
    );
  }
}
