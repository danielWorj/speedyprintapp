import 'package:speedy/Model/ServerResponse.dart';
import 'package:speedy/Model/chat/Message.dart';
import 'package:speedy/Repository/Chat/ChatRepositoryInt.dart';

import '../../Model/Client.dart';

class ChatController {
  final ChatrepositoryInt chatrepositoryInt;
  ChatController(this.chatrepositoryInt);

  Future<ServerResponse> sendMessage(Message message) {
    return this.chatrepositoryInt.sendMessage(message);
  }

  Future<ServerResponse> updateMessage(Message message) {
    return this.chatrepositoryInt.updateMessage(message);
  }

  Future<List<Client>> findListAllClientWhoSendMessage() {
    return this.chatrepositoryInt.findAllClientWhoSendMessage();
  }

  Future<List<Message>> findAllMessageByClient(int id) {
    print('all client message controller');
    return this.chatrepositoryInt.findAllMessageByClientWithId(id);
  }
}
