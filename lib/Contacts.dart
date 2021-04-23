import 'package:flutter/material.dart';
import 'package:task/Models/ContactModel.dart';
import 'package:task/APIs/ContactAPI.dart';

class Contacts extends StatefulWidget {
  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  @override
  Widget build(BuildContext context) {
    FetchAPI fetchAPI = FetchAPI();
    return Scaffold(
      body: FutureBuilder(
          future: fetchAPI.fetchContact(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done)
              return Center(child: CircularProgressIndicator());

            // if (snapshot.hasError) return Text('${snapshot.error}');
            //
            // if (!snapshot.hasData) return Text('Nothing to show');
            //
            // int statusCode = snapshot.data.statusCode;
            // if (statusCode > 299) return Text('Server error: $statusCode');

            List<ContactModel> contacts = snapshot.data;
            return ListView.builder(
              padding: EdgeInsets.all(8),
              itemCount: contacts.length,
              itemBuilder: (context, int index) {
                return Card(
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: ListTile(
                      leading: FittedBox(
                        child: CircleAvatar(
                          radius: 70,
                          backgroundImage: NetworkImage(contacts[index].image),
                        ),
                      ),
                      title: Text(
                        contacts[index].name,
                        style: TextStyle(fontSize: 18),
                      ),
                      subtitle: Text(contacts[index].phone),
                    ),
                  ),
                );
              },
            );
          }),
    );
  }
}
