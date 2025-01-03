import 'package:realm/realm.dart';
import '../../domain/models/task.dart';

class TaskRepository {
  final Realm realm;

  TaskRepository(this.realm);

  Future<List<Task>> getAllTasks() async {
    try {
      final tasks = realm.all<Task>().toList();
      return Future.value(tasks);
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<void> addTask(Task task) async {
    try {
      await realm.write(() async {
        realm.add(task);
      });
      return Future.value();
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<void> deleteTask(Task task) async {
    try {
      await realm.write(() async {
        realm.delete(task);
      });
      return Future.value();
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<void> updateTask(Task task, {required bool isComplete}) async {
    try {
      await realm.write(() async {
        task.isComplete = isComplete;
      });
      return Future.value();
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
