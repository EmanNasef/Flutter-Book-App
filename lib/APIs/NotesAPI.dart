import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:task/Models/NotesModel.dart';

class FetchAPI {
  Future<List<NotesModel>> fetchNotes() async {
    http.Response response =
        await http.get(Uri.parse('https://192.168.0.110:44370/api/notesAPI'));

    if (response.statusCode == 200) {
      //var body = jsonDecode(response.body);
      var body = jsonDecode(utf8.decode(response.bodyBytes));
      List<NotesModel> notes = [];

      for (var i in body) {
        notes.add(NotesModel.fromJson(i));
      }

      return notes;
    }

    return null;
  }
}
