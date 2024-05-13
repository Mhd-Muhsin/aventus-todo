import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/database/task_hive_model.dart';
import 'bloc/task_bloc.dart';
import 'pages/home_page.dart';

void main() async {
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(TaskModelAdapter().typeId)) {
    Hive.registerAdapter(TaskModelAdapter());
  }
  await Hive.openBox<TaskModel>(TaskModel.boxKey);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) {
      TaskBloc taskBloc = TaskBloc();
      taskBloc.add(GetTaskListEvent());
      return taskBloc;
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
        theme: ThemeData(primarySwatch: Colors.yellow),
      ),
    );
  }
}
