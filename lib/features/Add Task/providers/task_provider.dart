import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_management_app/constants/extension_constants.dart';
import 'package:task_management_app/features/Add%20Task/repository/database_repo.dart'; // Adjust path as needed
import 'package:task_management_app/features/Home/providers/home_provider.dart';
import 'package:task_management_app/model/task/task.dart'; // Adjust path as needed
import 'package:uuid/uuid.dart';

class TaskState {
  List<Task> taskList;
  List<Task> filteredTaskList; 
  DateTime selectedDate; 
  Priority priority; 
  String title; 
  String desc; 
  
  TaskState({
    required this.taskList,
    required this.selectedDate, 
    required this.priority, 
    required this.title, 
    required this.desc, 
    required this.filteredTaskList
  });

  TaskState copyWith({List<Task>? taskList, DateTime? selectedDate, Priority? priority, String? title, String? desc, List<Task>? filteredTaskList}) {
    return TaskState(
      taskList: taskList ?? this.taskList,
      selectedDate: selectedDate ?? this.selectedDate,
      priority: priority ?? this.priority, 
      title: title ?? this.title,
      desc: desc ?? this.desc,
      filteredTaskList: filteredTaskList??this.filteredTaskList
      );
  }

  factory TaskState.initial() {
    return TaskState(
      taskList: [], 
      selectedDate: DateTime.now(), 
      priority: Priority.low, 
      title: '',
      desc: '',
      filteredTaskList: []
      );
  }
}

class TaskNotifier extends Notifier<TaskState> {
  @override
  TaskState build() {
    return TaskState.initial();
  }

  void addTask() {
    ref.read(homeProvider.notifier).setFilterValue(4); 
    var taskId = const Uuid().v4();
    final newTask = Task(taskId: taskId, taskTitle: state.title, taskDesc: state.desc, dueDate: state.selectedDate, priority: state.priority);
    state = state.copyWith(taskList: [...state.filteredTaskList, newTask]);
    setTaskList(state.taskList);

    AppDatabase().addTask(newTask.toCompanion()); 

  }

  void updateTask(Task task) {
    final index = state.filteredTaskList.indexWhere((t)=>t.taskId==task.taskId);
    final newTaskList = state.filteredTaskList.toList();

    newTaskList[index] = task; 

    state = state.copyWith(filteredTaskList: newTaskList);


    AppDatabase().updateTask(task); 
    
  }

  void deleteTask(Task task) {
    int index = state.filteredTaskList.indexOf(task);
    final deletedTaskListItem = state.filteredTaskList.toList(); 
    deletedTaskListItem.removeAt(index); 
    state = state.copyWith(filteredTaskList: deletedTaskListItem); 

    AppDatabase().deleteTask(task.taskId); 
  }

  void fetchAllTasks() async {
    final tasks = await AppDatabase().loadAllTasks();
    state = state.copyWith(taskList: tasks.toTaskList(), filteredTaskList: tasks.toTaskList());
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
      desc: desc
    );
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


  void setTaskList (List<Task> tasks) 
  {
    state = state.copyWith(filteredTaskList: tasks); 
  }


}

final taskProvider = NotifierProvider<TaskNotifier, TaskState>(() {
  return TaskNotifier();
});
