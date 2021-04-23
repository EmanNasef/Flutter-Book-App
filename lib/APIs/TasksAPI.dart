import 'package:task/Models/TasksModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FetchAPI {
  Future<List<TasksModel>> fetchTasks() async {
    http.Response response =
        await http.get(Uri.parse('https://192.168.0.110:44370/api/tasksAPI'));

    var body = jsonDecode(response.body);

    if (response.statusCode == 200) {
      List<TasksModel> tasks = [];
      for (var i in body) {
        tasks.add(TasksModel.fromJson(i));
      }
      return tasks;
    }
    return null;
  }
}
