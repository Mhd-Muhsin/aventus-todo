import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
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
  late DateTime selectedDate;
  late String formattedDate;

  @override
  void initState() {
    super.initState();
    titleController.text = widget.task?.title ?? '';
    descriptionController.text = widget.task?.description ?? '';
    selectedDate = widget.task?.date ?? DateTime.now();
    formattedDate = DateFormat('dd/MM/yyyy').format(selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Container(
        height: 260,
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 08,),
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Task title",
                ),
              ),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Task Description",
                ),
              ),
              GestureDetector(
                child: Row(
                  children: [
                    Text("Date: "),
                    Text('${formattedDate}'),
                  ],
                ),
                onTap: (){
                  _selectDate(context);
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MyButton(text: "Save", onPressed: (){
                    if (titleController.text.isNotEmpty) {
                      Navigator.of(context).pop();
                      if (widget.isCreatePage) {
                        BlocProvider.of<TaskBloc>(context).add(SaveTaskEvent(TaskModel(title: titleController.text, description: descriptionController.text, status: false, date: selectedDate)));
                      } else{
                        BlocProvider.of<TaskBloc>(context).add(EditTaskEvent(TaskModel(id: widget.task?.id, title: titleController.text, description: descriptionController.text, status: widget.task?.status, date: selectedDate)));
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


  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2099),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: Colors.indigo,
                onPrimary: Colors.white,
                onSurface: Colors.black,
              ),
            ),
            child: child!,
          );
        });
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        formattedDate = DateFormat('dd/MM/yyyy').format(selectedDate);
      });
  }
}
