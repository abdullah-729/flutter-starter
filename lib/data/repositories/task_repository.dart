import 'package:realm/realm.dart';
import '../../domain/models/task.dart';

class TaskRepository {
  final Realm realm;

  TaskRepository(this.realm);

  Stream<List<Task>> getAllTasksStream() {
    final tasks = realm.all<Task>();
    return tasks.changes.map((changes) => changes.results.toList());
  }

  Future<void> addTask(Task task) async {
    try {
      realm.write(() {
        realm.add(task);
      });
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<void> deleteTask(Task task) async {
    try {
      realm.write(() {
        realm.delete(task);
      });
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<void> updateTask(Task task, {required bool isComplete}) async {
    try {
      realm.write(() {
        task.isComplete = isComplete;
      });
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
