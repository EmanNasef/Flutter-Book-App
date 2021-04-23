import 'package:task/Models/CalenderModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FetchAPI {
  Future<List<CalenderModel>> fetchCalender() async {
    http.Response response = await http
        .get(Uri.parse('https://192.168.0.110:44370/api/calenderAPI'));

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);

      List<CalenderModel> calender = [];

      for (var i in body) {
        calender.add(CalenderModel.fromJson(i));
      }
      return calender;
    }
    return null;
  }
}
