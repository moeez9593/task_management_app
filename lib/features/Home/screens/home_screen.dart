import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_management_app/constants/ui_contants.dart';
import 'package:task_management_app/features/Add%20Task/providers/task_provider.dart';
import 'package:task_management_app/features/Home/providers/home_provider.dart';
import 'package:task_management_app/features/Home/widgets/task_card_widget.dart';
import 'package:task_management_app/router/app_router.dart';


@RoutePage()
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
      ref.read(taskProvider.notifier).fetchAllTasks();
    });
  }

  @override
  Widget build(BuildContext context) {
    final tasks = ref.watch(taskProvider).filteredTaskList;
    final filterValue = ref.watch(homeProvider).filterValue; 
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.filter_alt)
            ,itemBuilder: (context)=>[
            const PopupMenuItem(value: 1, child: Text("High")),
            const PopupMenuItem(value: 2, child: Text("Medium")),
            const PopupMenuItem(value: 3, child: Text("Low")), 
            const PopupMenuItem(value: 4, child: Text("Show all tasks"))
          ],
          onSelected: (value) {
            ref.read(homeProvider.notifier).setFilterValue(value); 
          },
        )
      ],
    ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.router.push(AddTaskRoute()); 
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: homePadding,
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return TaskCardWidget(task: tasks[index]);
          },
          itemCount: tasks.length,
        ),
      ),
    );
  }
}
