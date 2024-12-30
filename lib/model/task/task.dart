// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:isar/isar.dart';

// part 'task.freezed.dart';
// part 'task.g.dart';

// @freezed
// @Collection(ignore: {'copyWith'})
// class TaskModel with _$TaskModel {
//   factory TaskModel({
//     required String taskId,
//     required String taskTitle,
//     required String taskDesc,
//     required DateTime dueDate,
//     required Priority priority,
//   }) = _Task;

//   const TaskModel._();

//   Id get id => Isar.autoIncrement;

//   factory TaskModel.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
// }

// enum Priority { low, medium, high }


import 'package:drift/drift.dart' as drift;

import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.freezed.dart';
part 'task.g.dart';

@freezed
abstract class Task with _$Task {
   factory Task({
    required String taskId,
    required String taskTitle,
    required String taskDesc,
    required DateTime dueDate,
    required Priority priority

  
}) = _Task;
   factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}

class TaskModel extends drift.Table {
  drift.IntColumn get id => integer().autoIncrement()(); 
  drift.TextColumn get taskId => text()(); 
  drift.TextColumn get taskTitle => text()(); 
  drift.TextColumn get taskDesc => text()(); 
  drift.DateTimeColumn get dueDate => dateTime()(); 
  drift.IntColumn get status => intEnum<Priority>()();
}



enum Priority { low, medium, high }