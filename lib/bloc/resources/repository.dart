import 'dart:async';
import "package:todo_app/Models/Classes/registerUser.dart";
import 'Registerprovider.dart';

class RegRepository{
  final registerApi = RegisterApi();
  Future<User> enterAllFields(
    String username, String firstname,String lastname,
     String email, String password) =>
  registerApi.registerUser(username, firstname, lastname, email, password );
}