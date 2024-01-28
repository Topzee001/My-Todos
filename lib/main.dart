import 'package:flutter/material.dart';
import 'package:todos/models/task_data.dart';
import 'package:todos/screens/tasks_screen.dart';
import 'package:provider/provider.dart';
//import 'package:todo/models/task_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // final String data = 'Top Secret Data';

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TasksScreen(),
      ),
    );
  }
}
