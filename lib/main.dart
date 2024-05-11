import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/database/task_hive_model.dart';
import 'pages/home_page.dart';

void main() async {
  await Hive.initFlutter();
  if(!Hive.isAdapterRegistered(TaskHiveModelAdapter().typeId)){
    Hive.registerAdapter(TaskHiveModelAdapter());
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(primarySwatch: Colors.yellow),
    );
  }
}
