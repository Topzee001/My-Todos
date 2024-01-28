library my_library;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todos/models/task_data.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'dart:convert';


class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();

    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.purpleAccent,
              ),
            ),
            TextField(
              controller: textEditingController,
              autofocus: true,
              textAlign: TextAlign.center,
            ),
            TextButton(
              child: Text(
                'Add',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
              style: TextButton.styleFrom(
                  backgroundColor: Colors.purpleAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0),
                  )),
              onPressed: () async {
                String newTaskTitle = textEditingController.text;
                if (newTaskTitle.isNotEmpty) {
                  Provider.of<TaskData>(context, listen: false)
                      .addTask(newTaskTitle);
                      //await Provider.of<TaskData>(context, listen: false)._saveTasks();
                  Navigator.pop(context);
                }
               
              },
            ),
          ],
        ),
      ),
    );
  }
}
