import 'package:flutter/material.dart';

class Conacts extends StatefulWidget {
  @override
  _ConactsState createState() => _ConactsState();
}

class _ConactsState extends State<Conacts> {
  List<String> contactNames = ['Eman Nasef ', 'Mahmoud', 'Samar', 'Ali'];
  List<num> contactPhones = [010000000, 1555505555, 1500055555, 0100001000];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(8),
      itemCount: contactNames.length,
      itemBuilder: (context, int index) {
        return Card(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: ListTile(
              leading: FittedBox(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage("images/$index.jpg"),
                ),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(contactNames[index]),
                  Text(contactPhones[index].toString())
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
