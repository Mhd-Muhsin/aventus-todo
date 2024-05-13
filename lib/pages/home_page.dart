import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/bloc/task_bloc.dart';
import 'package:todo_app/database/task_hive_model.dart';
import 'package:todo_app/widgets/dialog_box.dart';
import 'package:todo_app/widgets/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[100],
      appBar: AppBar(
        title: Text('To Do List',style: TextStyle(fontWeight: FontWeight.w500)),
        elevation: 0,
      ),
      body: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          if (state is TaskListLoadedState) {
            List<TaskModel?> taskList = [];
            taskList = state.taskList;
            if (taskList.isNotEmpty) {
              return ListView.builder(
                padding: EdgeInsets.only(bottom: 80),
                itemCount: taskList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: ToDoTile(
                      task: taskList[index],
                      // onChanged: (value) => checkBoxChanged(value, index),
                      // deleteFunction: (context) => deleteTask(index),
                    ),
                    onTap: (){
                      showTaskDialog(isCreatePage: false, task: taskList[index]);
                    },
                  );
                },
              );
            } else {
              return Center(
                child: Container(
                  child: Text("Nothing to do", style: TextStyle(fontWeight: FontWeight.w500),),
                ),
              );
            }
          } else {
            return Center(
              child: Container(
                child: Text("Something went wrong!"),
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showTaskDialog(isCreatePage: true);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void showTaskDialog({required bool isCreatePage, TaskModel? task}) {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          isCreatePage: isCreatePage,
          task: task,

          // onSave: saveNewTask,
          // onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  // void saveNewTask() {
  //   BlocProvider.of<TaskBloc>(context).add(SaveTaskEvent(TaskModel(title: titleController.text, description: descriptionController.text, status: false)));
  //   Navigator.of(context).pop();
  // }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      // taskList[index]?.status = !(taskList[index]?.status ?? false);
    });
    // db.updateDataBase();
  }

  void deleteTask(int index) {
    // setState(() {
    //   taskList.removeAt(index);
    // });
    // db.updateDataBase();
  }
}
