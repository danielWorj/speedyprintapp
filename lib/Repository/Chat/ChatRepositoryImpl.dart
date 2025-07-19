import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:speedy/Model/Client.dart';
import 'package:speedy/Model/ServerResponse.dart';
import 'package:speedy/Model/chat/Message.dart';
import 'package:speedy/Repository/Chat/ChatRepositoryInt.dart';
import 'package:speedy/Repository/EndPoint/EndPoint.dart';

class ChatRepositoryImpl implements ChatrepositoryInt {
  @override
  Future<ServerResponse> deleteMessage(int id) async {
    final uri = Uri.parse("$urlChat/delete/$id");

    final resp = await http.get(uri);

    final respBody = json.decode(resp.body);

    ServerResponse serverResponse = ServerResponse.fromJson(respBody);

    return serverResponse;
  }

  @override
  Future<List<Client>> findAllClientWhoSendMessage() async {
    // TODO: implement findAllClientWhoSendMessage
    List<Client> allClient = [];

    final uri = Uri.parse("$urlChat/all/client");
    final resp = await http.get(uri);

    final respBody = json.decode(resp.body);

    print(respBody);

    for (var i = 0; i < respBody.length; i++) {
      var client = respBody[i];
      allClient.add(Client.fromJson(client));
    }
    return allClient;
  }

  @override
  Future<List<Message>> findAllMessageByClientWithId(int id) async {
    // TODO: implement findAllMessageByClientWithId
    print('all client message repo');
    List<Message> allMessage = [];

    final uri = Uri.parse("$urlChat/all/byclient/$id");

    print(uri);
    final resp = await http.get(uri);
    print(resp);
    final respBody = json.decode(resp.body);

    print("all message by client response body");
    print(respBody);

    print(respBody);

    for (var i = 0; i < respBody.length; i++) {
      var message = respBody[i];
      allMessage.add(Message.fromJson(message));
    }
    return allMessage;
  }

  @override
  Future<ServerResponse> sendMessage(Message message) async {
    final uri = Uri.parse("$urlChat/client/send");
    final resp = await http.post(uri, body: message.toJson());

    ServerResponse serverResponse =
        new ServerResponse.fromJson(json.decode(resp.body));

    return serverResponse;
  }

  @override
  Future<ServerResponse> updateMessage(Message message) async {
    final uri = Uri.parse("$urlClient/client/update");
    final resp = await http.post(uri, body: message.toJson());

    ServerResponse serverResponse =
        new ServerResponse.fromJson(json.decode(resp.body));

    return serverResponse;
  }
}
