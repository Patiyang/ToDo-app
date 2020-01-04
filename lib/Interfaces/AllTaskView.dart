import 'package:flutter/material.dart';
import 'package:todo_app/Interfaces/taskTiles.dart';
import 'package:todo_app/Models/Tasks.dart';
import 'package:todo_app/Styling/global_styling.dart';
import 'package:todo_app/bloc/blocs/blocs.dart';

class HomeTab extends StatefulWidget {
  final String apiKey;
  HomeTab({Key key, /*this.title,*/ this.apiKey}) : super(key: key);
  // final String title;

  @override
  _HomeTab createState() => _HomeTab();
}

class _HomeTab extends State<HomeTab> {
  List<dynamic> taskList = []; //CHANGED HERE FROM
  TaskBloc taskBloc;

  @override
  void initState() {
    taskBloc = TaskBloc(widget.apiKey);
    super.initState(); // PAY ATTTENTION TO THIS !!!!!!
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // taskList = fetchTasks();
    return Container(
      color: greyColor,
      child: StreamBuilder(
        stream: taskBloc.tasks, //pass the getter of the stream here
        initialData: [], //List<Task>() the initial data
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          taskList = snapshot.data;
          // return _simpleReorderable(context, taskList);
          if (snapshot.hasData && snapshot != null) {
            if (snapshot.data.length > 0) {
              return _simpleReorderable(context, taskList);
            } else if (snapshot.data.length == 0) {
              return Center(
                child: Text('NO TASKS YET',style: TextStyle(color: Colors.white),),
              );
            }
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }

  Widget _buildListTile(BuildContext context, Task item) {
    return ListTile(
      key: Key(item.taskid.toString()),
      title: Todo(
        title: item.title,
      ),
    );
  }

  Widget _simpleReorderable(BuildContext context, List<Task> taskList) {
    print(taskList.length);
    //Widget _task = BouncingScrollPhysics();
    return Theme(
      data: ThemeData(canvasColor: Colors.transparent),
      child: ReorderableListView(
          padding: EdgeInsets.only(top: 300.0),
          children: taskList
              .map((Task item) => _buildListTile(context, item))
              .toList(),
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

  // Future<List<Task>> fetchTasks() async {
  //   List<Task> tasks = await taskBloc.addTask(widget.apiKey);
  //   print(tasks[0].title);
  //   return tasks;
  // }
}
