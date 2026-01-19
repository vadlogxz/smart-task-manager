import 'package:flutter/material.dart';
import 'package:smart_task_manager/domain/value_objects/task_priority.dart';

class TaskPrioritySelector extends StatelessWidget {
  final TaskPriority value;
  final ValueChanged<TaskPriority> onChanged;

  const TaskPrioritySelector({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<TaskPriority>(
      segments: const [
        ButtonSegment(value: TaskPriority.low, label: Text('Low')),
        ButtonSegment(value: TaskPriority.medium, label: Text('Medium')),
        ButtonSegment(value: TaskPriority.high, label: Text('High')),
      ],
      selected: {value},
      onSelectionChanged: (set) {
        onChanged(set.first);
      },
    );
  }
}
