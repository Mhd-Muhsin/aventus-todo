part of 'task_bloc.dart';

@immutable
abstract class TaskEvent {}

class GetTaskListEvent extends TaskEvent{}

class SaveTaskEvent extends TaskEvent{
  SaveTaskEvent(this.task);

  TaskModel task;
}

class DeleteTaskEvent extends TaskEvent{
  DeleteTaskEvent(this.id);

  String id;
}

class CheckBoxClickEvent extends TaskEvent{
  CheckBoxClickEvent(this.task);

  TaskModel task;
}

class EditTaskEvent extends TaskEvent{
  EditTaskEvent(this.task);

  TaskModel task;
}
