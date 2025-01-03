import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/models/task.dart';
import 'package:flutter_application_1/route/routes.dart';
import 'package:flutter_application_1/ui/task_list/view_model/task_list_view_model.dart';

class TaskListView extends StatelessWidget {
  final TaskListViewModel viewModel;

  const TaskListView({required this.viewModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tasks")),
      body: FutureBuilder<List<Task>>(
        future: viewModel.fetchTasks(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No tasks available'));
          } else {
            final tasks = snapshot.data!;
            return ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index];
                return ListTile(
                  title: Text(task.title),
                  subtitle: Text(task.description),
                  trailing: Checkbox(
                    value: task.isComplete,
                    onChanged: (_) => viewModel.toggleTaskCompletion(task),
                  ),
                  onLongPress: () => viewModel.deleteTask(task),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, Routes.taskForm);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
