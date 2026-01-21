import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smart_task_manager/domain/entities/task.dart';

String? _formatDue(BuildContext context, DateTime? date) {
  if (date == null) return null;
  final locale = Localizations.localeOf(context).toString();
  final formatter = DateFormat.yMMMd(locale);
  return formatter.format(date.toLocal());
}

class TaskSubtitle extends StatelessWidget {
  final Task task;

  const TaskSubtitle({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final dueText = _formatDue(context, task.dueDate);
    final hasDescription = (task.description != null && task.description!.toString().trim().isNotEmpty);

    if (!hasDescription && dueText == null) return const SizedBox.shrink();

    final baseColor = Theme.of(context).textTheme.bodySmall?.color;
    final descColor = baseColor?.withAlpha((0.9 * 255).round());
    final metaColor = baseColor?.withAlpha((0.7 * 255).round());

    final children = <Widget>[];
    if (hasDescription) {
      children.add(Text(
        task.description.toString(),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: descColor,
        ),
      ));
    }
    if (dueText != null) {
      children.add(SizedBox(height: hasDescription ? 6 : 0));
      children.add(Row(
        children: [
          Icon(Icons.calendar_today, size: 14, color: metaColor),
          SizedBox(width: 6),
          Text(
            'Due: $dueText',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: metaColor,
            ),
          ),
        ],
      ));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }
}
