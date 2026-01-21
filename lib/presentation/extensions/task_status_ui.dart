import 'package:flutter/material.dart';
import 'package:smart_task_manager/domain/value_objects/task_status.dart';

extension TaskStatusLabel on TaskStatus {
  String get label {
    switch (this) {
      case TaskStatus.todo:
        return 'To Do';
      case TaskStatus.inProgress:
        return 'In Progress';
      case TaskStatus.done:
        return 'Done';
      case TaskStatus.blocked:
        return 'Blocked';
    }
  }
  Color color(ColorScheme scheme) {
    switch (this) {
      case TaskStatus.done:
        return scheme.secondary;
      case TaskStatus.inProgress:
        return Colors.amber;
      case TaskStatus.blocked:
        return scheme.error;
      case TaskStatus.todo:
        return scheme.primary.withAlpha((0.8 * 255).round());
    }
  }
}