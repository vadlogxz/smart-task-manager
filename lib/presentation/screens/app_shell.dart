import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_task_manager/presentation/providers/bottom_nav_provider.dart';
import 'package:smart_task_manager/presentation/screens/add_task_screen.dart';
import 'package:smart_task_manager/presentation/screens/task_list_screen.dart';

class AppShell extends ConsumerWidget {
  const AppShell({super.key});

  static const _tabs = <Widget>[
    TaskListScreen(),
    _PlaceholderScreen(title: 'Settings'),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(bottomNavIndexProvider);

    return Scaffold(
      body: IndexedStack(
        index: index,
        children: _tabs,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const AddTaskScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: Row(
          children: [
            Expanded(
              child: IconButton(
                tooltip: 'Tasks',
                onPressed: () => ref.read(bottomNavIndexProvider.notifier).setIndex(0),
                icon: Icon(
                  Icons.checklist,
                  color: index == 0 ? Theme.of(context).colorScheme.primary : null,
                ),
              ),
            ),
            const SizedBox(width: 48),
            Expanded(
              child: IconButton(
                tooltip: 'Settings',
                onPressed: () => ref.read(bottomNavIndexProvider.notifier).setIndex(1),
                icon: Icon(
                  Icons.settings,
                  color: index == 1 ? Theme.of(context).colorScheme.primary : null,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PlaceholderScreen extends StatelessWidget {
  final String title;
  const _PlaceholderScreen({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text(title)),
    );
  }
}
