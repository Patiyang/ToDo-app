import 'package:flutter/material.dart';
import 'package:todo_app/Models/My_tasks.dart';
import 'package:todo_app/Models/Classes/Tasks.dart';
import 'package:todo_app/Styling/global_styling.dart';

class HomeTab extends StatefulWidget {
  HomeTab({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeTab createState() => _HomeTab();
}

class _HomeTab extends State<HomeTab> {
  List<Task> taskList = []; //added line
  Widget build(BuildContext context) {
    taskList = fetchTasks();
    return Container(
      color: greyColor,
      child: _simpleReorderable(context),
      // child: ReorderableListView(
      //   physics: const BouncingScrollPhysics(),
      //   padding: EdgeInsets.only(top: 270),
      //   children: tasks,
      //   onReorder: _onReorder
      // ),
    );
  }

  Widget _buildListTile(BuildContext context, Task item) {
    return ListTile(
     key: Key(item.taskID), 
     title: Todo(
       title: item.title,
     ),
     );
  }

  Widget _simpleReorderable(BuildContext context) {
     //Widget _task = BouncingScrollPhysics();
    return Theme(
      data: ThemeData(
        canvasColor: Colors.transparent
      ),
          child: ReorderableListView(
          padding: EdgeInsets.only(top: 300.0),
          children:taskList.map((Task item) => _buildListTile(context, item)).toList(),
          onReorder: (oldIndex, newIndex) {
            setState(() {
              Task item = taskList[oldIndex];
              taskList.remove(item);
              taskList.insert(newIndex, item);
            });
          //physics: BouncingScrollPhysics();
          }),
    );
  }

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final Task item = taskList.removeAt(oldIndex);
      taskList.insert(newIndex, item);
    });
  }

  List<Task> fetchTasks() {
    for (int i = 0; i < 5; i++) {
      taskList.add(Task('my first todo '+ i.toString(), false, i.toString()));
    }
    return taskList;
  }
}
