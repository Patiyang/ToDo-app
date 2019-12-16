import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import 'package:todo_app/Models/Classes/registerUser.dart';

class RegisterApi{
  Client client = Client();
   final _apiKey = 'http://10.0.2.2:5000/api/register';
  Future<User> registerUser(
    String username, String firstname, String lastname, 
    String email,String password) async{
    print('you are in ');
    final response = await client
    .post('http://10.0.2.2:5000/api/register', 
     body: jsonEncode({  	
            "username":username,
            "first_name": firstname,
            "last_name":lastname,
            "email":email,
            "password":password
          }
      )
    );
    print(response.body.toString());
    if (response.statusCode == 201){
      return User.fromJson(json.decode(response.body));
    }else{
      throw Exception('failed to register');
    }
  }
}
