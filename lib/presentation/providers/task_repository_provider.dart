import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_task_manager/data/repositories/in_memory_task_repository.dart';
import 'package:smart_task_manager/domain/repositories/task_repository.dart';

final taskRepositoryProvider = Provider<TaskRepository>((ref) {
  return InMemoryTaskRepository();
});