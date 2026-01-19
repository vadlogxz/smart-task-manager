import 'package:smart_task_manager/domain/entities/task.dart';
import 'package:smart_task_manager/domain/repositories/task_repository.dart';
import 'package:smart_task_manager/domain/value_objects/task_id.dart';
import 'package:smart_task_manager/domain/value_objects/task_priority.dart';
import 'package:smart_task_manager/domain/value_objects/task_status.dart';
import 'package:smart_task_manager/domain/value_objects/task_title.dart';

class InMemoryTaskRepository implements TaskRepository{
  final Map<String, Task> _tasks = {};

  InMemoryTaskRepository(){
    _seed();
  }

  @override
  Future<Task?> getById(TaskId id) async {
    return _tasks[id.value];
  }

  @override
  Future<void> save(Task task) async {
    _tasks[task.id.value] = task;
  }

  @override
  Future<List<Task>> getAll() async {
    return _tasks.values.toList(growable: false);
  }

  void _seed() {
    final now = DateTime.now();

    final initialTasks = <Task>[
      Task(
        id: TaskId.fromString('1'),
        title: TaskTitle.fromString('Buy groceries'),
        description: 'Milk, Bread, Eggs, Butter',
        dueDate: now.add(const Duration(days: 1)),
        status: TaskStatus.todo,
        priority: TaskPriority.low
      ),
      Task(
        id: TaskId.fromString('2'),
        title: TaskTitle.fromString('Walk the dog'),
        description: 'Evening walk in the park',
        dueDate: now.add(const Duration(days: 1)),
        status: TaskStatus.inProgress,
        priority: TaskPriority.low
      ),
      Task(
        id: TaskId.fromString('3'),
        title: TaskTitle.fromString('Read a book'),
        description: 'Finish reading Flutter documentation',
        dueDate: now.add(const Duration(days: 3)),
        status: TaskStatus.done,
        priority: TaskPriority.low
      ),
      Task(
        id: TaskId.fromString('4'),
        title: TaskTitle.fromString('Book dentist appointment'),
        description: 'Call Dr. Smith\'s office',
        dueDate: now.add(const Duration(days: 4)),
        status: TaskStatus.blocked,
        priority: TaskPriority.low
      ),
    ];

    for (final task in initialTasks) {
      _tasks[task.id.value] = task;
    }
  }
}