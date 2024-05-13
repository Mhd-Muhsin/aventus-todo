import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/bloc/task_bloc.dart';
import 'package:todo_app/database/task_hive_model.dart';

class ToDoTile extends StatefulWidget {
  TaskModel? task;

  ToDoTile({
    super.key,
    required this.task,
  });

  @override
  State<ToDoTile> createState() => _ToDoTileState();
}

class _ToDoTileState extends State<ToDoTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15, top: 20),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.indigo[300],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Checkbox(
                  value: widget.task?.status ?? false,
                  onChanged: (value){
                    setState(() {
                      widget.task?.status = !(widget.task?.status ?? false);
                    });
                    BlocProvider.of<TaskBloc>(context).add(CheckBoxClickEvent(TaskModel(id: widget.task?.id, status: widget.task?.status)));
                  },
                  activeColor: Colors.black,
                ),
                Text(
                  widget.task?.title ?? '',
                  style: TextStyle(
                    decoration: widget.task?.status ?? false
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
            IconButton(
                onPressed: (){
                  BlocProvider.of<TaskBloc>(context).add(DeleteTaskEvent(widget.task?.id ?? ''));
                },
                icon: Icon(Icons.delete, color: Colors.black,))
          ],
        ),
      ),
    );
  }
}
