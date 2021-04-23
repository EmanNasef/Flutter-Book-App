import 'package:http/http.dart' as http;
import 'package:task/Models/ContactModel.dart';
import 'dart:convert';

class FetchAPI {
  Future<List<ContactModel>> fetchContact() async {
    http.Response response = await http
        .get(Uri.parse('https://192.168.0.110:44370/api/contactsAPI'));

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);

      List<ContactModel> contact = [];

      for (var i in body) {
        contact.add(ContactModel.fromJson(i));
      }
      return contact;
    }
    return null;
  }
}
