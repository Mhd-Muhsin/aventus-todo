import 'package:hive_flutter/hive_flutter.dart';
part 'task_hive_model.g.dart';

@HiveType(typeId: 0)
class TaskModel extends HiveObject{
  TaskModel({this.id, this.title, this.description, this.status});

  static const String boxKey = 'task';

  @HiveField(0)
  String? id;

  @HiveField(1)
  String? title;

  @HiveField(2)
  String? description;

  @HiveField(3)
  bool? status;
}