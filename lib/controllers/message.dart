import 'package:first_priority_app/controllers/api.dart';
import 'package:first_priority_app/models/message.dart';
import 'package:get/get.dart';

class MessageController extends GetxController {
  final api = Get.find<Api>();

  RxList<Message> _messages = RxList<Message>();

  Future<List<Message>> get() async {
    if (_messages.isEmpty) {
      final res = await api.client.get('/api/messages');

      var list = List.from(res.data).map((e) => Message.fromMap(e)).toList();
      list.insert(0, Message(id: "reminder", name: "Reminder"));
      _messages(list);
    }

    return _messages;
  }

  Future<void> send(String meetingId, String id) async {
    await api.client.post('/api/messages/$meetingId/$id');
  }
}
