import 'package:flutter_application_1/data/repositories/task_repository.dart';
import 'package:flutter_application_1/domain/models/task.dart';

class TaskListViewModel {
  final TaskRepository repository;

  TaskListViewModel(this.repository);

  Stream<List<Task>> get tasksStream => repository.getAllTasksStream();

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
