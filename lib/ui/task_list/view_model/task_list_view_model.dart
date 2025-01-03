import 'package:flutter_application_1/data/repositories/task_repository.dart';
import 'package:flutter_application_1/domain/models/task.dart';

class TaskListViewModel {
  final TaskRepository repository;

  TaskListViewModel(this.repository);

  Future<List<Task>> fetchTasks() async {
    try {
      return await repository.getAllTasks();
    } catch (e) {
      throw Exception("Error fetching tasks: $e");
    }
  }

  Future<void> deleteTask(Task task) async {
    try {
      await repository.deleteTask(task);
    } catch (e) {
      throw Exception("Error deleting task: $e");
    }
  }

  Future<void> toggleTaskCompletion(Task task) async {
    try {
      await repository.updateTask(task, isComplete: !task.isComplete);
    } catch (e) {
      throw Exception("Error toggling task completion: $e");
    }
  }
}
