part of 'task_bloc.dart';

@immutable
abstract class TaskState {}

class TaskInitial extends TaskState {}

class TaskListLoadedState extends TaskState{
  TaskListLoadedState(this.taskList);

  List<TaskModel?> taskList;
}