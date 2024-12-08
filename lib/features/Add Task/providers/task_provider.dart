import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_management_app/model/task/task.dart'; // Adjust path as needed
import 'package:task_management_app/features/Add%20Task/repository/database_repo.dart'; // Adjust path as needed
import 'package:uuid/uuid.dart';

class TaskState {
  List<Task> taskList;
  TaskState({required this.taskList});

  TaskState copyWith({List<Task>? taskList}) {
    return TaskState(taskList: taskList ?? this.taskList);
  }

  factory TaskState.initial() {
    return TaskState(taskList: []);
  }
}

class TaskNotifier extends Notifier<TaskState> {
  @override
  TaskState build() {
    return TaskState.initial();
  }

  void addTask(
      String taskTitle, String taskDesc, DateTime dueDate, String priority) {
    var taskId = const Uuid().v4();
    final task = Task(
        taskId: taskId,
        taskTitle: taskTitle,
        taskDesc: taskDesc,
        dueDate: dueDate,
        status: TaskStatus.pending,
        priority: priority);
    state = state.copyWith(taskList: [...state.taskList, task]);
    IsarService().addTask(task); // Pass the entire task object
  }

  void updateTask(Task task) {
    // Pass the entire task object
    final index = state.taskList.indexWhere((t) => t.taskId == task.taskId);
    if (index != -1) {
      state.taskList[index] = task;
      state = state.copyWith(taskList: [...state.taskList]);
      IsarService().updateTodo(
          task.taskId, task); // Assuming updateTodo handles Task objects
    }
  }

  void deleteTask(String taskId) {
    state = state.copyWith(
      taskList: state.taskList.where((task) => task.taskId != taskId).toList(),
    );

    IsarService().deleteTodo(taskId);
  }

  void fetchAllTasks() async {
    final taskList = await IsarService().loadAllTodos();
    state = state.copyWith(taskList: taskList);
  }
}

final taskProvider = NotifierProvider<TaskNotifier, TaskState>(() {
  return TaskNotifier();
});
