import 'package:flutter/material.dart';
import 'package:task/APIs/NotesAPI.dart';
import 'package:task/Models/NotesModel.dart';

class Notes extends StatefulWidget {
  @override
  _NotesState createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  FetchAPI fetchAPI = FetchAPI();

  Color _getColorById(int id) {
    if (id == 1) return Colors.amberAccent;
    if (id == 2) return Colors.white;
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchAPI.fetchNotes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done)
            return Center(child: CircularProgressIndicator());

          List<NotesModel> myNotes = snapshot.data;
          return ListView.builder(
            itemCount: myNotes.length,
            itemBuilder: (context, int index) {
              return MyContainer(
                color: _getColorById(myNotes[index].id),
                title: myNotes[index].title,
                note: myNotes[index].description,
              );
            },
          );
        });
  }
}

class MyContainer extends StatelessWidget {
  var color;
  String title;
  String note;

  MyContainer({this.title, this.note, this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 5,
          ),
          Text(note),
        ],
      ),
    );
  }
}
