import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todos/models/task_data.dart';
import 'package:todos/widgets/task_tile.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//import 'package:todo/models/task.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskTile(
              isChecked: task.isDone,
              taskTitle: task.name,
              checkboxCallback: (checkboxState) {
                taskData.updateTask(task);
              },
              longPressCallback: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                        title: Text('Delete task'),
                        content:
                            Text('Are you sure you want to delete this task?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              taskData.deleteTask(task);
                              Navigator.pop(context);
                            },
                            child: Text('Delete'),
                          ),
                        ]);
                  },
                );
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
