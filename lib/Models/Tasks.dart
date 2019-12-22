class Task {
  List<Task> tasks;
  String note;
  DateTime timeToComplete;
  bool done;
  String repeats;
  DateTime deadline;
  List<DateTime> reminders;
  String taskid;
  String title;

  Task(this.taskid, this.title, this.done, this.note);

  Task.fromJson(Map<String, dynamic> parsedJson) {
    Task task = new Task(
      parsedJson['id'],
      parsedJson['title'],
      parsedJson['done'],
      parsedJson['note']
    );
  }
}
