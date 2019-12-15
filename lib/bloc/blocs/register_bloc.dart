import 'package:todo_app/bloc/resources/repository.dart';
import 'package:todo_app/Models/Classes/registerUser.dart';
import 'package:rxdart/rxdart.dart';
//import 'package:observable/observable.dart';


class RegisterBloc{
  final _repository = RegRepository();
  final _userSaver = PublishSubject<User>();

  Observable<User> get allFields => _userSaver.stream;

  registerUser( String username, String firstname,String lastname,
     String email, String password) async {
   User user = await _repository.enterAllFields(username, firstname, lastname, email, password);
   _userSaver.sink.add(user);
  }
  dispose(){
    _userSaver.close();
  }
}
final bloc = RegisterBloc();