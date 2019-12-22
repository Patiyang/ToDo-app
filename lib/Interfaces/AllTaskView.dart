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
  List<Task> taskList = [];
  Widget build(BuildContext context) {
    // taskList = fetchTasks();
    return Container(
      color: greyColor,
      child: FutureBuilder(
        future: fetchTasks(),
        // initialData: InitialData,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.none &&
              snapshot.hasData == null) {
            // taskList = snapshot.data;
            // print('task data is present');
            return Container();
          }
          return ListView.builder(
            itemCount: taskList.length,
            itemBuilder: (BuildContext context, int index) {
              taskList = snapshot.data;
              return _simpleReorderable(context, taskList);
            },
          );
        },
      ),
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

  Future<List<Task>> fetchTasks() async {
    List<Task> tasks = await taskBloc.addTask(widget.apiKey);
    return tasks;
  }
}
