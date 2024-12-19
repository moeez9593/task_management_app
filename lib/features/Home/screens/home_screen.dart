import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:task_management_app/features/Add%20Task/providers/task_provider.dart';
import 'package:task_management_app/features/Home/widgets/task_card_widget.dart';
import 'package:task_management_app/router/app_routes.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Fetch tasks after the widget is built
      ref.read(taskProvider.notifier).fetchAllTasks();
    });
  }

  @override
  Widget build(BuildContext context) {
    final tasks = ref.watch(taskProvider).taskList;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushNamed("add-task");
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return TaskCardWidget(title: tasks[index].taskTitle);
        },
        itemCount: tasks.length,
      ),
    );
  }
}
