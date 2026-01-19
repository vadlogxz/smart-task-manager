import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_task_manager/domain/value_objects/task_priority.dart';
import 'package:smart_task_manager/domain/value_objects/task_title.dart';
import 'package:smart_task_manager/presentation/providers/create_task_provider.dart';
import 'package:smart_task_manager/presentation/providers/task_list_provider.dart';
import 'package:smart_task_manager/presentation/widgets/deadline_selector.dart';
import 'package:smart_task_manager/presentation/widgets/labeled_text_field.dart';
import 'package:smart_task_manager/presentation/widgets/task_priority_selector.dart';

class AddTaskScreen extends ConsumerStatefulWidget {
  const AddTaskScreen({super.key});

  @override
  ConsumerState<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends ConsumerState<AddTaskScreen> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  TaskPriority _priority = TaskPriority.medium;
  DateTime? _deadline = DateTime.now();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _addTask() async {
    final createTask = ref.read(createTaskProvider);
    await createTask(
      title: TaskTitle.fromString(_titleController.text),
      description: _descriptionController.text,
      priority: _priority,
      dueDate: _deadline,
    );
    await ref.read(taskListProvider.notifier).reload();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Task'),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Column(
        children: [
          LabeledTextField(title: 'Title', controller: _titleController),
          LabeledTextField(
            title: 'Description',
            controller: _descriptionController,
          ),
          TaskPrioritySelector(
            value: _priority,
            onChanged: (newPriority) {
              setState(() => _priority = newPriority);
            },
          ),
          DeadlineSelector(
            value: _deadline,
            onChanged: (newDeadline) {
              setState(() => _deadline = newDeadline);
            },
          ),
          ElevatedButton(
            onPressed: () async {
              await _addTask();
              if (!context.mounted) return;
              Navigator.pop(context);
            },
            child: const Text('Add Task'),
          ),

        ],
      ),
    );
  }
}
