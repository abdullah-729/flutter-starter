import 'package:flutter_application_1/data/repositories/task_repository.dart';
import 'package:flutter_application_1/domain/models/task.dart';

class TaskFormViewModel {
  final TaskRepository repository;

  TaskFormViewModel(this.repository);

  Future<void> addTask(String title, String description) async {
    try {
      final task = Task(title, description);
      await repository.addTask(task);
    } catch (e) {
      throw Exception("Error adding task: $e");
    }
  }

  // Future<void> updateTask(Task task, String title, String description) async {
  //   try {
  //     repository.updateTask(task,
  //         title: title, description: description, isComplete: false);
  //   } catch (e) {
  //     throw Exception("Error updating task: $e");
  //   }
  // }
}
