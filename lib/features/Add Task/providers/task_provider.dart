import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_management_app/constants/extension_constants.dart';
import 'package:task_management_app/features/Add%20Task/repository/database_repo.dart'; // Adjust path as needed
import 'package:task_management_app/model/task/task.dart'; // Adjust path as needed
import 'package:uuid/uuid.dart';

class TaskState {
  List<Task> taskList;
  DateTime selectedDate; 
  Priority priority; 
  String title; 
  String desc; 
  TaskState({
    required this.taskList,
    required this.selectedDate, 
    required this.priority, 
    required this.title, 
    required this.desc
  });

  TaskState copyWith({List<Task>? taskList, DateTime? selectedDate, Priority? priority, String? title, String? desc}) {
    return TaskState(
      taskList: taskList ?? this.taskList,
      selectedDate: selectedDate ?? this.selectedDate,
      priority: priority ?? this.priority, 
      title: title ?? this.title,
      desc: desc ?? this.desc
      );
  }

  factory TaskState.initial() {
    return TaskState(
      taskList: [], 
      selectedDate: DateTime.now(), 
      priority: Priority.low, 
      title: '',
      desc: ''
      );
  }
}

class TaskNotifier extends Notifier<TaskState> {
  @override
  TaskState build() {
    return TaskState.initial();
  }

  void addTask() {
    var taskId = const Uuid().v4();
    final newTask = Task(taskId: taskId, taskTitle: state.title, taskDesc: state.desc, dueDate: state.selectedDate, priority: state.priority);

    state = state.copyWith(taskList: [...state.taskList, newTask]);
    AppDatabase().addTask(newTask.toCompanion()); 

  }

  // void updateTask(Task task) {
  //   final index = state.taskList.indexWhere((t) => t.taskId == task.taskId);
  //   if (index != -1) {
  //     state.taskList[index] = task;
  //     state = state.copyWith(taskList: [...state.taskList]);
  //     IsarService().updateTodo(
  //         task.taskId, task); 
  //   }
  // }

  // void deleteTask(String taskId) {
  //   state = state.copyWith(
  //     taskList: state.taskList.where((task) => task.taskId != taskId).toList(),
  //   );

  //   IsarService().deleteTodo(taskId);
  // }

  void fetchAllTasks() async {
    final tasks = await AppDatabase().loadAllTasks();
    state = state.copyWith(taskList: tasks.toTaskList());
  }
  
  void onDateSelected (DateTime date)
  {
     state = state.copyWith(selectedDate: date); 
  }

  void onOptionSelected (Priority priority)
  {
     state = state.copyWith(priority: priority); 
  }

  void setTaskTitleAndDescription (String title, String desc)
  {
     state = state.copyWith(
      title: title, 
      desc: desc);
  }

  void resetFieldsOnScreenLaunch ()
  {
    state = state.copyWith(
      title: '',
      desc: '',
      selectedDate: DateTime.now(),
      priority: Priority.high
    ); 
  }


}

final taskProvider = NotifierProvider<TaskNotifier, TaskState>(() {
  return TaskNotifier();
});
