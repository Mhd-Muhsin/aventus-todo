import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/database/task_hive_model.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskInitial()) {

    on<GetTaskListEvent>((event, emit) {

      List<TaskModel?> taskList = [TaskModel(title: "Test task")];

      taskList = getTaskListFromHive();

      print(taskList.map((e) => e?.title));
      print(taskList.map((e) => e?.description));
      print(taskList.map((e) => e?.status));

      emit(TaskListLoadedState(taskList));
    });

    on<SaveTaskEvent>((event, emit) async{
      await saveTaskToHive(event.task);
      List<TaskModel?> taskList = getTaskListFromHive();
      emit(TaskListLoadedState(taskList));
    });

    on<DeleteTaskEvent>((event, emit) async{
      await deleteTask(event.id);
      List<TaskModel?> taskList = getTaskListFromHive();
      emit(TaskListLoadedState(taskList));
    });

    on<CheckBoxClickEvent>((event, emit) async{
      await updateTask(event.task);
    });

    on<EditTaskEvent>((event, emit) async{
      await updateTask(event.task);
      List<TaskModel?> taskList = getTaskListFromHive();
      emit(TaskListLoadedState(taskList));
    });

  }

  List<TaskModel?> getTaskListFromHive(){
    final taskBox = Hive.box<TaskModel>(TaskModel.boxKey);
    return taskBox.keys.map((key) {
      final taskModel = taskBox.get(key);
      taskModel?.id = key.toString();
      return taskModel;
    }).toList();
  }

  Future<void> saveTaskToHive(TaskModel task) async {
    final taskBox = Hive.box<TaskModel>(TaskModel.boxKey);
    DateTime now = DateTime.now();
    String timestamp = '${now.year}${now.month}${now.day}${now.hour}${now.minute}${now.second}';
    await taskBox.put(timestamp, task);
  }

  Future<void> deleteTask(String id)async {
    try {
      final taskBox = Hive.box<TaskModel>(TaskModel.boxKey);
      await taskBox.delete(id);
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateTask(TaskModel task) async {
    try {
      final taskBox = Hive.box<TaskModel>(TaskModel.boxKey);
      final TaskModel? dbTaskData = await getTaskData(task.id ?? '');
      if(task.title != null) dbTaskData?.title = task.title;
      if(task.description != null) dbTaskData?.description = task.description;
      if(task.status != null) dbTaskData?.status = task.status;
      await taskBox.put(task.id ?? '', dbTaskData!);
    } catch (e) {
      print(e);
    }
  }

  Future<TaskModel?> getTaskData(String taskId) async {
    try {
      final taskBox = Hive.box<TaskModel>(TaskModel.boxKey);
      final task = taskBox.get(taskId);
      // dbTaskData?.id = taskId;
      return task;
    } catch (e) {
      print(e);
    }
  }
}
