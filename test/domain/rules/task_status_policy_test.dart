import 'package:flutter_test/flutter_test.dart';
import 'package:smart_task_manager/domain/entities/task.dart';
import 'package:smart_task_manager/domain/value_objects/task_id.dart';
import 'package:smart_task_manager/domain/value_objects/task_priority.dart';
import 'package:smart_task_manager/domain/value_objects/task_status.dart';
import 'package:smart_task_manager/domain/rules/task_status_policy.dart';
import 'package:smart_task_manager/domain/errors/invalid_task_status_transition.dart';
import 'package:smart_task_manager/domain/value_objects/task_title.dart';

void main() {
  group('TaskStatusPolicy', () {
    late TaskStatusPolicy policy;

    setUp(() {
      policy = TaskStatusPolicy();
    });

    test('should allow changing from TODO to IN_PROGRESS', () {
      final task = Task(
        id: TaskId.fromString('1'),
        title: TaskTitle.fromString('Test Task'),
        status: TaskStatus.todo,
        dueDate: DateTime.now(),
        priority: TaskPriority.low
      );
      expect(
        () => policy.assertCanChangeStatus(task, TaskStatus.inProgress),
        returnsNormally,
      );
    });

    test('should not allow changing from DONE to TODO', () {
      final task = Task(
        id: TaskId.fromString('2'),
        title: TaskTitle.fromString('Completed Task'),
        status: TaskStatus.done,
        dueDate: DateTime.now(),
        priority: TaskPriority.low
      );
      expect(
        () => policy.assertCanChangeStatus(task, TaskStatus.todo),
        throwsA(isA<InvalidTaskStatusTransition>()),
      );
    });

    test('should not allow changing from BLOCKED to IN_PROGRESS', () {
      final task = Task(
        id: TaskId.fromString('3'),
        title: TaskTitle.fromString('Blocked Task'),
        status: TaskStatus.blocked,
        dueDate: DateTime.now(),
        priority: TaskPriority.low
      );
      expect(
        () => policy.assertCanChangeStatus(task, TaskStatus.inProgress),
        throwsA(isA<InvalidTaskStatusTransition>()),
      );
    });

    test('should allow changing from IN_PROGRESS to DONE', () {
      final task = Task(
        id: TaskId.fromString('4'),
        title: TaskTitle.fromString('Ongoing Task'),
        status: TaskStatus.inProgress,
        dueDate: DateTime.now(),
        priority: TaskPriority.low
      );
      expect(
        () => policy.assertCanChangeStatus(task, TaskStatus.done),
        returnsNormally,
      );
    });
  });
}
