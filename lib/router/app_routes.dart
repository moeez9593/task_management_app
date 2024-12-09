import 'package:go_router/go_router.dart';
import 'package:task_management_app/features/Add%20Task/screens/add_task_screen.dart';
import 'package:task_management_app/features/Home/screens/home_screen.dart';

final GoRouter appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    name: 'home',
    path: '/',
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
      name: "add-task",
      path: '/add-task',
      builder: (context, state) => const AddTaskScreen())
]);
