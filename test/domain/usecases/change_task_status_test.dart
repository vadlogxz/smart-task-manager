import 'package:flutter_test/flutter_test.dart';
import 'package:smart_task_manager/domain/entities/task.dart';
import 'package:smart_task_manager/domain/errors/task_not_found.dart';
import 'package:smart_task_manager/domain/repositories/task_repository.dart';
import 'package:smart_task_manager/domain/usecases/change_task_status.dart';
import 'package:smart_task_manager/domain/value_objects/task_id.dart';
import 'package:smart_task_manager/domain/value_objects/task_status.dart';
import 'package:smart_task_manager/domain/rules/task_status_policy.dart';
import 'package:smart_task_manager/domain/value_objects/task_title.dart';

class FakeTaskRepository implements TaskRepository {
  Task? task;
  Task? savedTask;

  @override
  Future<Task?> getById(TaskId id) async {
    return task;
  }

  @override
  Future<void> save(Task task) async {
    savedTask = task;
  }

  @override
  Future<List<Task>> getAll() async {
    return [];
  }
}

void main() {
  late FakeTaskRepository repository;
  late ChangeTaskStatus usecase;

  setUp(() {
    repository = FakeTaskRepository();
    usecase = ChangeTaskStatus(
      repository: repository,
      policy: TaskStatusPolicy(),
    );
  });

  test('changes task status and saves task', () async {
    // arrange
    final task = Task(
      id: TaskId('1'),
      title: TaskTitle('Test task'),
      description: '',
      dueDate: DateTime.now(),
      status: TaskStatus.todo,
    );

    repository.task = task;

    // act
    await usecase(
      task.id,
      TaskStatus.inProgress,
    );

    // assert
    expect(repository.savedTask, isNotNull);
    expect(repository.savedTask!.status, TaskStatus.inProgress);
  });

  test('throws TaskNotFound when task does not exist', () async {
    // arrange
    final taskId = TaskId('missing');

    // act
    final call = usecase(
      taskId,
      TaskStatus.done,
    );

    // assert
    expect(
          () => call,
      throwsA(isA<TaskNotFound>()),
    );
  });

  test('throws error when status transition is invalid', () async {
    // arrange
    final task = Task(
      id: TaskId('1'),
      title: TaskTitle('Test'),
      description: '',
      dueDate: DateTime.now(),
      status: TaskStatus.done,
    );

    repository.task = task;

    // act
    final call = usecase(
      task.id,
      TaskStatus.todo,
    );

    // assert
    expect(
          () => call,
      throwsA(isA<Exception>()),
    );
  });


}
