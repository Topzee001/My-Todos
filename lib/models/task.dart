
//import 'package:shared_preferences/shared_preferences.dart';

class Task {
  final String name;
  bool isDone;

  Task({required this.name, this.isDone = false});

  Map<String, dynamic> toMap(){
    return {
      'name': name,
      'isDone': isDone,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map){
    return Task(
      name: map['name'], 
      isDone: map['isDone'],
      );
  }
  
  void toggleDone() {
    isDone = !isDone;
  }
}
