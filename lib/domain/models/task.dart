import 'package:realm/realm.dart';

part 'task.realm.dart';

@RealmModel()
class _Task {
  late String title;
  late String description;
  bool isComplete = false;
}
