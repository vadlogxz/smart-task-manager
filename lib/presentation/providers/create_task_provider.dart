import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_task_manager/domain/usecases/create_task.dart';
import 'package:smart_task_manager/presentation/providers/task_repository_provider.dart';

final createTaskProvider = Provider<CreateTask>((ref){
  final repository = ref.read(taskRepositoryProvider);

  return CreateTask(repository: repository);
});