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

class TaskBloc {
  final _repository = RegRepository();
  final _taskSubject = BehaviorSubject<List<Task>>();
  String apiKey;
  var _tasks = <Task>[];

  TaskBloc(String api_key) {
    this.apiKey = api_key;
    _updateTasks(api_key).then((_) {
      _taskSubject.add(_tasks);
    });
  }
  Stream<List<Task>> get tasks => _taskSubject.stream;
  // Observable<List<Task>> get getTasks => _taskSaver.stream;
  Future<List<Task>> _updateTasks(String apiKey) async {
    return await _repository.addUserTasks(apiKey);
  }
}

final userBloc = RegisterBloc();
// final taskBloc = TaskBloc();
