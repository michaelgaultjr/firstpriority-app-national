import 'package:first_priority_app/models/notification.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:path/path.dart' as p;

class NotificationStore {
  final _store = StoreRef<String, Map<String, dynamic>>('notifications');
  final Database db;

  Future<String> add(Notification notification) async {
    await _store.record(notification.id).put(db, notification.toMap());
    return notification.id;
  }

  Future<void> delete(String id) async {
    await _store.record(id).delete(db);
  }

  Future<List<Notification>> list() async {
    final records = await _store.find(
      db,
      finder: Finder(
        sortOrders: [
          SortOrder('time', false),
        ],
      ),
    );

    return records.map((e) => Notification.fromMap(e.value)).toList();
  }

  Future<Notification> last() async {
    final record = await _store.findFirst(
      db,
      finder: Finder(
        sortOrders: [
          SortOrder('time', false),
        ],
      ),
    );

    return Notification.fromMap(record.value);
  }

  NotificationStore(this.db);

  static Future<NotificationStore> createInstance() async {
    var dir = await getApplicationDocumentsDirectory();
    await dir.create(recursive: true);
    final db =
        await databaseFactoryIo.openDatabase(p.join(dir.path, 'local.db'));

    return NotificationStore(db);
  }
}
