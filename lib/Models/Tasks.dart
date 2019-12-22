class Task {
  List<Task> tasks;
  String note;
  DateTime timeToComplete;
  bool done;
  String repeats;
  DateTime deadline;
  List<DateTime> reminders;
  int taskid;
  String title;

  Task(this.taskid, this.done, this.title,  this.note);

  Task.fromJson(Map<String, dynamic> parsedJson) {
    Task task = new Task(
      parsedJson['id'],
      parsedJson['title'],
      parsedJson['done'],
      parsedJson['note']
    );
  }
}
