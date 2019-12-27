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
    // print('trying to sign in an existing user');
    final response = await client.post('http://10.0.2.2:5000/api/signin',
        headers: {"Authorization": apiKey},
        body: jsonEncode({"username": username, "password": password}));
    // print(response.body.toString());
    final Map result = json.decode(response.body);
    if (response.statusCode == 201) {
      saveApiKey(result['data']['api_key']);
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('failed to sign in');
    }
  }

  Future<List<Task>> addTasks(String apiKey) async {
    // print('attempting to add a new task');
    final response = await client.get(
      'http://10.0.2.2:5000/api/tasks',
      headers: {"Authorization": apiKey},
    );
    final Map result = json.decode(response.body);
    if (response.statusCode == 201) {
      List<Task> tasks = [];
      for (Map json_ in result['data']) {
        // print('\n' +json_['done'].toString());
        try {
          tasks.add(Task.fromJson(json_));
          // print(json_);
        } catch (Exception) {
          print(Exception);
        }
      }
      // for (Task task in tasks){
      //   print(task.taskid);
      // }
        //print(tasks.toString());
      return tasks;
    } else {
      throw Exception('failed to load post');
    }
  }

  saveApiKey(String apiKey) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // await prefs.setString('API_Token', apiKey);
    prefs.setString('API_Token', apiKey);
  }
}
