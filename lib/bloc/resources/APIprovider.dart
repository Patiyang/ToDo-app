import 'dart:async';
import 'package:http/http.dart' show Client;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/Models/Tasks.dart';
import 'dart:convert';
import 'package:todo_app/Models/Users.dart';

//here we make the post requests to the API

class RegisterApi {
  Client client = Client();
  final _apiProvider = 'http://10.0.2.2:5000/api/register';

  Future<User> registerUser(String username, String firstname, String lastname,
      String email, String password) async {
    print('you are in ');
    final response = await client.post(_apiProvider,
        body: jsonEncode({
          "username": username,
          "first_name": firstname,
          "last_name": lastname,
          "email": email,
          "password": password
        }));
    print(response.body.toString());
    final Map result = json.decode(response.body);
    if (response.statusCode == 201) {
      saveApiKey(result['data']['api_key']);
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('failed to register');
    }
  }

  Future<User> signInUser(
      String username, String password, String apiKey) async {
    final response = await client.post('http://10.0.2.2:5000/api/signin',
        headers: {"Authorization": apiKey},
        body: jsonEncode({"username": username, "password": password}));
    final Map result = json.decode(response.body);
    if (response.statusCode == 201) {
      saveApiKey(result['data']['api_key']);
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('failed to sign in');
    }
  }

  Future addTask(String apiKey, String taskName, String deadline) async {
    final response = await client.post('http://10.0.2.2:5000/api/tasks',
        headers: {"Authorization": apiKey},
        body: jsonEncode({
          "title": taskName,
          "deadline": deadline,
          "done": false,
          "reminder": "",
          "note": "",
          "repeats":""
        }));
    if (response.statusCode == 201) {
      print('task added');
    } else {
      throw Exception('failed to add task');
    }
  }

  Future<List<Task>> getTask(String apiKey) async {
    final response = await client.get(
      'http://10.0.2.2:5000/api/tasks',
      headers: {"Authorization": apiKey},
    );
    final Map result = json.decode(response.body);
    if (response.statusCode == 201) {
      List<Task> tasks = [];
      for (Map json_ in result['data']) {
        try {
          tasks.add(Task.fromJson(json_));
        } catch (Exception) {
          print(Exception);
        }
      }
      return tasks;
    } else {
      throw Exception('failed to load post');
    }
  }


  saveApiKey(String apiKey) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('API_Token', apiKey);
  }
}
