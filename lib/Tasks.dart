import 'package:flutter/material.dart';

class Tasks extends StatefulWidget {
  @override
  _TasksState createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  Map<String, bool> tasks = {
    'Skin Care': true,
    'Study': false,
    'House Work': false,
    'Games': true
  };
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: tasks.keys.map((String e) {
        return Card(
          child: CheckboxListTile(
              title: Text(e.toString()),
              controlAffinity: ListTileControlAffinity.leading,
              value: tasks[e],
              onChanged: (bool val) {
                setState(() {
                  tasks[e] = val;
                });
              }),
        );
      }).toList(),
    );
  }
}
