import 'package:smart_task_manager/domain/entities/task.dart';
import 'package:smart_task_manager/domain/value_objects/task_id.dart';

abstract class TaskRepository {
  Future<Task?> getById(TaskId id);
  Future<void> save(Task task);
  Future<List<Task>> getAll();
}