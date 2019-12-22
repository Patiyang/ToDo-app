import 'package:todo_app/Models/Tasks.dart';
import 'package:todo_app/bloc/resources/repository.dart';
import 'package:todo_app/Models/Users.dart';
import 'package:rxdart/rxdart.dart';
//import 'package:observable/observable.dart';

class RegisterBloc {
  final _repository = RegRepository();
  final _userSaver = PublishSubject<User>();
  final _taskSaver = PublishSubject<Task>();

  Observable<User> get allFields => _userSaver.stream;
  Observable<Task> get allTasks => _taskSaver.stream;

  registerUser(String username, String firstname, String lastname, String email,
      String password) async {
    User user = await _repository.enterAllFields(
        username, firstname, lastname, email, password);
    _userSaver.sink.add(user);
  }
//make a post request to the api and check whether the password and uname match
  signInUser(String username, String password, String apiKey) async {
    User user = await _repository.signIn(username, password, apiKey);
    _userSaver.sink.add(user);
  }

  dispose() {
    _userSaver.close();
  }
}

class TaskBloc{
  final _repository = RegRepository();
  final _taskSaver = PublishSubject<List<Task>>();

  Observable<List<Task>> get allTasks => _taskSaver.stream;

   addTask(String apiKey) async{
    List<Task> tasks = await _repository.addUserTasks(apiKey);
    _taskSaver.sink.add(tasks);
    return tasks;
  }
dispose(){
  _taskSaver.close();
}
}

final userBloc = RegisterBloc();
final taskBloc= TaskBloc();