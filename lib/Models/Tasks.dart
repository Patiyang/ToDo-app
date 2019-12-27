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

  Task(this.title, this.taskid, this.done, this.note);

  factory Task.fromJson(Map<String, dynamic> parsedJson) {
    // for(String key in parsedJson.keys){
    //   print(key);
    // }
    return Task(
      parsedJson['title'],
      parsedJson['id'], 
      parsedJson['done'],
      parsedJson['note']
      );
  }
}
