import 'package:speedy/Model/chat/Message.dart';

import '../../Model/Client.dart';
import '../../Model/ServerResponse.dart';

abstract class ChatrepositoryInt {
  Future<List<Message>> findAllMessageByClientWithId(int id);
  Future<List<Client>> findAllClientWhoSendMessage();
  Future<ServerResponse> sendMessage(Message message);
  Future<ServerResponse> updateMessage(Message message);
  Future<ServerResponse> deleteMessage(int id);
}
