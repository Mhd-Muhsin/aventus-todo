import 'package:hive_flutter/hive_flutter.dart';
part 'task_hive_model.g.dart';

@HiveType(typeId: 0)
class TaskHiveModel extends HiveObject{
  // static const String boxKey = 'task';

  @HiveField(0)
  String? title;

  @HiveField(1)
  String? description;

  @HiveField(2)
  bool? status;
}