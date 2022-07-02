import 'package:qidgym_management_system/model/chat.dart';

abstract class ChatService {
  Stream<List<ChatModel>> readChatMessage();
  Future<void> addMessage() async {}
  Future<void> clearMessage() async {}
}
