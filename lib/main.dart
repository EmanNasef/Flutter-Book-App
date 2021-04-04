import 'package:flutter/material.dart';
import 'Tasks.dart';
import 'Contacts.dart';
import 'Notes.dart';
import 'Calender.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eman Nasef Task',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Flutter Book'),
            bottom: TabBar(
              tabs: [
                Tab(text: 'Calender', icon: Icon(Icons.assignment)),
                Tab(text: 'Conacts', icon: Icon(Icons.assignment_ind)),
                Tab(text: 'Notes', icon: Icon(Icons.notes)),
                Tab(text: 'Tasks', icon: Icon(Icons.assignment_turned_in)),
              ],
            ),
          ),
          body: TabBarView(children: [
            Calender(),
            Conacts(),
            Notes(),
            Tasks(),
          ]),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
