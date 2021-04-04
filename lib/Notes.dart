import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Notes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MyContainer(
          color: Colors.amberAccent,
          title: 'My first Note',
          note: 'it seems to be good , lol I don\'t found words to write :D ',
        ),
        MyContainer(
          color: Colors.white,
          title: 'Find the difference word ',
          note:
              'Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Blu Bla Bla Bla Bla Bla Bla Bla Bla BlaBla Bla Bla Bla Bla Bla Bla Bla',
        ),
        MyContainer(
          color: Colors.red,
          title: 'Be Careful',
          note: 'you should study well ',
        )
      ],
    );
  }
}

// ignore: must_be_immutable
class MyContainer extends StatelessWidget {
  Color color;
  String title;
  String note;
  MyContainer({this.color, this.title, this.note});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        color: color,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          Text(note),
        ],
      ),
    );
  }
}
