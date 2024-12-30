// import 'package:isar/isar.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:task_management_app/model/task/task.dart';

// class IsarService {
//   late Future<Isar> db;

//   IsarService() {
//     db = _initDb();
//   }

//   Future<Isar> _initDb() async {
//     if (Isar.instanceNames.isEmpty) {
//       final dir = await getApplicationDocumentsDirectory();
//       final isar = await Isar.open(
//         [TaskSchema],
//         directory: dir.path,
//         inspector: true,
//       );

//       return isar;
//     }

//     return Future.value(Isar.getInstance());
//   }

//   Future<void> addTask(Task newTask) async {
//     final isar = await db;
//     await isar.writeTxn(() => isar.tasks.put(newTask));
//   }

//   Future<void> deleteTodo(String taskId) async {
//     final Isar dbInstance = await db;

//     final Task? task =
//         await dbInstance.tasks.filter().taskIdEqualTo(taskId).findFirst();

//     try {
//       await dbInstance.writeTxn(() async {
//         await dbInstance.tasks.delete(task!.id);
//       });
//       print('Todo with id ${task?.taskId} deleted successfully');
//     } catch (e) {
//       print('Failed to delete todo with id ${task?.taskId}: $e');
//     }
//   }

//   Future<void> updateTodo(String todoId, Task task) async {
//     final Isar dbInstance = await db;

//     final Task? todo =
//         await dbInstance.tasks.filter().taskIdEqualTo(todoId).findFirst();

//     try {
//       await dbInstance.writeTxn(() async {
//         await dbInstance.tasks.put(task);
//       });
//       print('Todo with id ${todo?.taskId} deleted successfully');
//     } catch (e) {
//       print('Failed to delete todo with id ${todo?.taskId}: $e');
//     }
//   }

//   Future<List<Task>> loadAllTodos() async {
//     final Isar dbInstance = await db;
//     final todos = await dbInstance.tasks.where().findAll();
//     return todos;
//   }
// }


import 'dart:io';

import 'package:drift/drift.dart';
import 'package:path_provider/path_provider.dart';
import 'package:task_management_app/model/task/task.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'database_repo.g.dart';


@DriftDatabase(tables: [TaskModel])
class AppDatabase extends _$AppDatabase {
   AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

 static QueryExecutor _openConnection() {
    return driftDatabase(name: 'my_database');
  }

  Future<int> addTask (TaskModelCompanion task) 
  {
    return into(taskModel).insert(task);
  }


  Future<List<TaskModelData>> loadAllTasks () async
  {
    final List<TaskModelData> tasks = await taskModel.all().get(); 
    return tasks; 
  }


  




}