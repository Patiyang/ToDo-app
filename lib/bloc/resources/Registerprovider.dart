import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import 'package:todo_app/Models/Classes/registerUser.dart';

class RegisterApi{
  Client client = Client();
   final _apiKey = 'your api key';
  Future<User> registerUser(
    String username, String firstname, String lastname, 
    String email,String password) async{
    print('\n\n\n\n\nyou are in\n\n\n\n\n ');
    final response = await client
    .post('http://127.0.0.1:5000/api/register',
      
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
    if (response.statusCode == 200){
      return User.fromJson(json.decode(response.body));
    }else{
      throw Exception('failed to register');
    }
  }


}
