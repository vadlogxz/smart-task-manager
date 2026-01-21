import 'package:flutter/material.dart';
import 'package:smart_task_manager/domain/entities/task.dart';
import 'package:smart_task_manager/domain/value_objects/task_status.dart';
import 'package:smart_task_manager/presentation/extensions/task_status_ui.dart';
import 'package:smart_task_manager/presentation/widgets/task_subtitle.dart';

class TaskTileContent extends StatelessWidget {
  final Task task;
  final void Function(TaskStatus) onStatusChanged;

  const TaskTileContent({super.key, required this.task, required this.onStatusChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  task.title.toString(),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 8),
              PopupMenuButton<TaskStatus>(
                onSelected: onStatusChanged,
                itemBuilder: (BuildContext context) {
                  return TaskStatus.values.map((TaskStatus status) {
                    return PopupMenuItem(value: status, child: Text(status.label));
                  }).toList();
                },
                icon: Icon(Icons.more_vert, color: Theme.of(context).iconTheme.color),
              ),
            ],
          ),
          const SizedBox(height: 8),
          TaskSubtitle(task: task),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Builder(builder: (context) {
                final statusColor = Theme.of(context).colorScheme.primary;
                return Text(
                  task.status.label,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(color: statusColor, fontWeight: FontWeight.w600),
                );
              }),
            ],
          ),
        ],
      ),
    );
  }
}
