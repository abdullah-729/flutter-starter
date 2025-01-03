import 'package:realm/realm.dart';
import '../../domain/models/task.dart';

class RealmService {
  late final Realm realm;

  RealmService() {
    var config = Configuration.local([Task.schema]);
    realm = Realm(config);
  }

  Realm getRealmInstance() => realm;

  void closeRealm() {
    realm.close();
  }
}
