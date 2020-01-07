import 'dart:async';
import 'package:todo_app/Models/Tasks.dart';
import "package:todo_app/Models/Users.dart";
import 'APIprovider.dart';

//here the user is registered

class Repository {
  final apiProvider = RegisterApi();

  Future<User> enterAllFields(String username, String firstname,
          String lastname, String email, String password) =>
      apiProvider.registerUser(username, firstname, lastname, email, password);

  Future<User> signIn(String username, String password, String apiKey) =>
      apiProvider.signInUser(username, password, apiKey);

  Future/*<List<Task>> */ getUserTasks(String apiKey) =>
      apiProvider.getTask(apiKey);

  Future addUserTask(String apiKey, String taskName, String deadline) =>
      apiProvider.addTask(apiKey, taskName, deadline);
}
