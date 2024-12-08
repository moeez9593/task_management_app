import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'task.freezed.dart';
part 'task.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class Task with _$Task {
  factory Task(
      {required String taskId,
      required String taskTitle,
      required String taskDesc,
      required DateTime dueDate,
      required TaskStatus status,
      required String priority}) = _Task;

  const Task._();

  @enumerated
  TaskStatus get taskStatus => TaskStatus.inProgress;

  Id get id => Isar.autoIncrement;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}

enum TaskStatus { pending, inProgress, completed }
