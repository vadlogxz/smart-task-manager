import 'package:flutter/material.dart';
import 'package:smart_task_manager/domain/entities/task.dart';
import 'package:smart_task_manager/domain/value_objects/task_status.dart';
import 'package:smart_task_manager/presentation/extensions/task_status_ui.dart';
import 'package:smart_task_manager/presentation/widgets/task_tile_content.dart';

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
    final statusColor = task.status.color(Theme.of(context).colorScheme);

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border(
              left: BorderSide(color: statusColor, width: 6),
            ),
          ),
          child: TaskTileContent(
            task: task,
            onStatusChanged: onStatusChanged,
          ),
        ),
      ),
    );
  }
}
