import 'package:todo_app/Models/Tasks.dart';
import 'package:todo_app/bloc/resources/repository.dart';
import 'package:todo_app/Models/Users.dart';
import 'package:rxdart/rxdart.dart';

class RegisterBloc {
  final _repository = Repository();
  final _userSaver = PublishSubject<User>();

  Observable<User> get allFields => _userSaver.stream;

  registerUser(String username, String firstname, String lastname, String email,
      String password) async {
    User user = await _repository.enterAllFields(
        username, firstname, lastname, email, password);
    _userSaver.sink.add(user);
  }

  signInUser(String username, String password, String apiKey) async {
    User user = await _repository.signIn(username, password, apiKey);
    _userSaver.sink.add(user);
  }

  dispose() {
    _userSaver.close();
  }
}

class TaskBloc {
  final _repository = Repository();
  final _taskSubject = BehaviorSubject<List<Task>>();
  String apiKey;
  var _tasks = <Task>[];

  TaskBloc(String apikey) {
    this.apiKey = apikey;
    _updateTasks(apikey).then((_) {
      _taskSubject.add(_tasks);
    });
  }
  Stream<List<Task>> get tasks => _taskSubject.stream;

  Future<Null> _updateTasks(String apiKey) async {
    _tasks = await _repository.getUserTasks(apiKey);
  }
}

final userBloc = RegisterBloc();
