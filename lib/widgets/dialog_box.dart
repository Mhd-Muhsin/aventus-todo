import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo_app/bloc/task_bloc.dart';
import 'package:todo_app/database/task_hive_model.dart';

import 'my_button.dart';

class DialogBox extends StatefulWidget {
  bool isCreatePage;
  TaskModel? task;


  DialogBox({
    required this.isCreatePage,
    this.task
  });

  @override
  State<DialogBox> createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  void initState() {
    titleController.text = widget.task?.title ?? '';
    descriptionController.text = widget.task?.description ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: Container(
        height: 220,
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Task title",
                ),
                validator: (value){

                },
              ),

              TextField(
                controller: descriptionController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Task Description",
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MyButton(text: "Save", onPressed: (){
                    if (titleController.text.isNotEmpty) {
                      Navigator.of(context).pop();
                      if (widget.isCreatePage) {
                        BlocProvider.of<TaskBloc>(context).add(SaveTaskEvent(TaskModel(title: titleController.text, description: descriptionController.text, status: false)));
                      } else{
                        BlocProvider.of<TaskBloc>(context).add(EditTaskEvent(TaskModel(id: widget.task?.id, title: titleController.text, description: descriptionController.text, status: widget.task?.status)));
                      }
                    } else {
                      showToast('Title cannot be empty');
                    }
                  }),

                  const SizedBox(width: 8),

                  MyButton(text: "Cancel", onPressed: (){
                    Navigator.of(context).pop();
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  showToast(String msg){
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.orange,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
