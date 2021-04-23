import 'package:flutter/material.dart';
import 'package:task/APIs/TasksAPI.dart';
import 'package:task/Models/TasksModel.dart';

class Tasks extends StatefulWidget {
  @override
  _TasksState createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  @override
  Widget build(BuildContext context) {
    FetchAPI fetchAPI = FetchAPI();
    return FutureBuilder(
        future: fetchAPI.fetchTasks(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done)
            return Center(child: CircularProgressIndicator());

          List<TasksModel> tasks = snapshot.data;

          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, int index) {
              bool isChecked = tasks[index].state;
              return Card(
                child: CheckboxListTile(
                    title: Text(
                      tasks[index].title,
                      style: TextStyle(
                          decoration: isChecked
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                          color: isChecked ? Colors.grey : Colors.black),
                    ),
                    subtitle: Text(tasks[index].subTitle),
                    controlAffinity: ListTileControlAffinity.leading,
                    value: isChecked,
                    onChanged: (bool val) {
                      setState(() {
                        isChecked = val;
                      });
                    }),
              );
            },
          );
        });
  }
}
